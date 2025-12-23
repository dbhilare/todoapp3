package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestTerraformInitAndPlan(t *testing.T) {
	terraformOptions := &terraform.Options{
		TerraformDir: "../environments/development",
		NoColor:      true,
	}

	terraform.InitAndPlan(t, terraformOptions)
}

