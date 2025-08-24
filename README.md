# Deploy-de-ADDS-com-Clients

Este projeto automatiza o provisionamento de um ambiente de Active Directory Domain Services (ADDS) e clientes Windows usando Terraform e scripts PowerShell no Azure.

## Estrutura dos arquivos

- **ADDS.ps1**: Script PowerShell que instala o ADDS, configura o DNS e realiza o provisionamento do domínio, incluindo a senha de modo de segurança.
- **adds_variables.tf**: Define variáveis do domínio, NETBIOS, senha de modo de segurança e prepara o template para execução do script ADDS.ps1.
- **delay.tf**: Utiliza o recurso `time_sleep` para garantir que a instalação do ADDS seja concluída antes de outras etapas.
- **JOIN.ps1**: Script PowerShell para desabilitar o firewall e renovar o IP do cliente após ingressar no domínio.
- **main.tf**: Configura o provider Azure, credenciais e backend opcional para o estado do Terraform.
- **output.tf**: Exporta os IPs públicos das VMs criadas (ADDS e clientes).
- **peering.tf**: Cria o peering entre as redes virtuais (VNets) do ADDS e dos clientes.
- **random.tf**: Gera uma senha aleatória para o usuário administrador das VMs Windows.
- **random_id.tf**: Gera um ID aleatório para nomear recursos de forma única.
- **rg.tf**: Cria os Resource Groups para o servidor ADDS e para os clientes.
- **variables.tf**: Define variáveis de nomes, localizações, nomes de VNets, subnets, usuário e senha das VMs.
- **vm-adds.tf**: Provisiona a VM do ADDS, IP público, interface de rede, regras de segurança, extensão para instalar o ADDS e associações de recursos.
- **vm-win11.tf**: Provisiona a VM cliente Windows 11, IP público, interface de rede, regras de segurança, extensão para ingressar no domínio e associações de recursos.
- **vnets.tf**: Cria as redes virtuais, subnets e configura os servidores DNS para ADDS e clientes.

## Como usar
1. Configure suas credenciais do Azure no arquivo `main.tf`.
2. Ajuste variáveis conforme necessário nos arquivos `.tf`.
3. Execute `terraform init`, `terraform plan` e `terraform apply` para provisionar o ambiente.

---

Dúvidas ou sugestões? Abra uma issue no repositório!
