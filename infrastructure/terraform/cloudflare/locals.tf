
locals {
  cloudflare_zone_name =  var.cloudflare_zone_name
  cloudflare_account_id = var.cloudflare_account_id
  cloudflare_api_token =  var.cloudflare_api_token

  zoho_txt_value = var.zoho_txt_value
  dkim_value     = var.dkim_value
  dmarc_value    = var.dmarc_value

  cloudflare_record = {
    # "documentation" = {
    #     name = "@"
    #     value = "chaijunkin.github.io"
    #     type = "CNAME"
    #     proxied = true
    # }
    "zoho_txt" = {
      name  = "@"
      value = local.zoho_txt_value
      type  = "TXT"
    }
    "zoho_mx1" = {
      name     = "@"
      value    = "mx.zoho.com"
      type     = "MX"
      priority = 10
    }
    "zoho_mx2" = {
      name     = "@"
      value    = "mx2.zoho.com"
      type     = "MX"
      priority = 20
    }
    "zoho_mx3" = {
      name     = "@"
      value    = "mx3.zoho.com"
      type     = "MX"
      priority = 50
    }
    "zoho_spf" = {
      name  = "@"
      value = "v=spf1 include:zoho.com ~all"
      type  = "TXT"
    }
    "zoho_dkim" = {
      name  = "zmail._domainkey"
      value = local.dkim_value
      type  = "TXT"
      ttl   = 1
    }
    "zoho_dmarc" = {
      name  = "_dmarc"
      value = local.dmarc_value
      type  = "TXT"
    }
    "gitops-docs" = {
      name    = "gitops-test"
      value   = "chaijunkin.github.io"
      type    = "CNAME"
      proxied = true
    }
    "documentation" = {
      name    = "www"
      value   = "chaijunkin.github.io"
      type    = "CNAME"
      proxied = true
    }
    "vaultwarden" = {
      name  = "vw"
      value = "blue-cherry-8641.fly.dev"
      type  = "CNAME"
    }
    "external-uptimekuma" = {
      name = "ext-uptime"
      value = "uptime-kuma-rdm12exn709.fly.dev"
      type = "CNAME"
    }
    # "external-uptimekuma-status-page" = {
    #   name = "ext-status"
    #   value = "ext-uptime.${var.cloudflare_zone_name}"
    #   type = "CNAME"
    # }
  }

  github_A_record = [
    "185.199.108.153",
    "185.199.109.153",
    "185.199.110.153",
    "185.199.111.153"
  ]
  github_AAAA_record = [
    "2606:50c0:8000::153",
    "2606:50c0:8001::153",
    "2606:50c0:8002::153",
    "2606:50c0:8003::153"
  ]
}