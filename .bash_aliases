# Docker
alias docker-start="docker-compose start"
alias docker-stop="docker-compose stop"
alias docker-up="docker-compose up -d"
alias docker-down="docker-compose down"

docker-ssh()
{
	docker-compose exec ${1} sh
}
