
*** Variables ***
# ainda falta forma consistente de passar esses valores como variáveis de ambiente
#${BROWSER}     headlesschrome
${BROWSER}     chrome
${BASE_URL}    https://kroton.platosedu.io/erp/login/auth 

#constantes
${CONST.MAX_TIMEOUT}    30s
${CONST.RETRY_TIME}    100ms