package main

import (
	"fmt"
	"os"

	bcrypwpassword "github.com/akm/bcrypt_password"
	"github.com/spf13/cobra"
)

func main() {
	rootCmd := &cobra.Command{Use: "bcryptpw", Version: bcrypwpassword.Version}
	rootCmd.AddCommand(Digest())
	if err := rootCmd.Execute(); err != nil {
		fmt.Fprintf(os.Stderr, "%+v\n", err)
		os.Exit(1)
	}
}
