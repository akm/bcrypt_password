package main

import (
	"github.com/spf13/cobra"
)

func Digest() *cobra.Command {
	var cost int
	cmd := &cobra.Command{
		Use:     "digest",
		Short:   "digest PASSWORD",
		Example: "bcryptpw digest YOUR_PASSWORD",
		RunE: func(cmd *cobra.Command, args []string) error {
			return nil
		},
	}
	cmd.Flags().IntVarP(&cost, "cost", "c", 1, "cost")
	return cmd
}
