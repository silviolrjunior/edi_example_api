class XmlsController < ApplicationController

  def create
    puts params
    render xml: '
      <fatura>
        <id>19224</id>
        <client_name>Silvio Lopes Ribeiro</client_name>
        <client_id>21</client_id>
        <price>R$195</price>
      </fatura>',
    status: 201
  end
end
