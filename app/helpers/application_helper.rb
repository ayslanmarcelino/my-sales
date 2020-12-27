module ApplicationHelper
  def format_document_number(document_number)
    document_number.length == 11 ? document_number.to_br_cpf : document_number.to_br_cnpj
  end
end
