# frozen_string_literal: true

# MAPEAMENTO DA PAGINA PRINCIPAL DO SITE
class ElegibilidadeScreen < SitePrism::Page
    include Helpers
    include BaseScreen
    include ElegibilidadeModule
  
    element :mensagem_sucesso, '.styles__InputResponse-nummfe-10.figQeW'
    element :mensagem_erro, '.styles__InputResponse-nummfe-10.fsDWDr'


end     