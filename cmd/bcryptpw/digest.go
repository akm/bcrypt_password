package main

import (
	"fmt"

	"github.com/spf13/cobra"
	"golang.org/x/crypto/bcrypt"
)

func Digest() *cobra.Command {
	var cost int
	cmd := &cobra.Command{
		Use:     "digest",
		Short:   "digest PASSWORD",
		Example: "bcryptpw digest YOUR_PASSWORD",
		Args: func(cmd *cobra.Command, args []string) error {
			if len(args) < 1 {
				return fmt.Errorf("requires at least 1 arg(s), only received %d", len(args))
			}
			return nil
		},
		RunE: func(cmd *cobra.Command, args []string) error {
			hashed, err := bcrypt.GenerateFromPassword([]byte(args[0]), cost)
			if err != nil {
				return err
			}
			fmt.Println(string(hashed))
			return nil
		},
	}
	cmd.Flags().IntVarP(&cost, "cost", "c", 1, "cost")
	return cmd
}
