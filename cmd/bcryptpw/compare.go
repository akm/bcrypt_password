package main

import (
	"fmt"

	"github.com/spf13/cobra"
	"golang.org/x/crypto/bcrypt"
)

func Compare() *cobra.Command {
	cmd := &cobra.Command{
		Use:     "compare",
		Short:   "digest HASHED_PASSWORD PASSWORD",
		Example: "bcryptpw digest YOUR_HASHED_PASSWORD YOUR_PASSWORD",
		Args: func(cmd *cobra.Command, args []string) error {
			if len(args) < 2 {
				return fmt.Errorf("requires at least 1 arg(s), only received %d", len(args))
			}
			return nil
		},
		RunE: func(cmd *cobra.Command, args []string) error {
			err := bcrypt.CompareHashAndPassword([]byte(args[0]), []byte(args[1]))
			if err != nil {
				fmt.Println(err.Error())
			} else {
				fmt.Println("OK")
			}
			return nil
		},
	}
	return cmd
}
