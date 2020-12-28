module ApplicationHelper
  def format_document_number(document_number)
    document_number.length == 11 ? document_number.to_br_cpf : document_number.to_br_cnpj
  end

  def translate_boolean(boolean)
    boolean ? t('application.positive') : t('application.negative')
  end

  def function_color(active, admin, super_admin)
    return 'danger' if !active
    return 'success' if super_admin
    return 'info' if admin
    return 'secondary' if !admin
  end

  def function_translate(active, admin, super_admin)
    return t('application.disabled') if !active
    return t('application.super_admin') if super_admin
    return t('application.admin') if admin
    return t('application.employee') if !admin
  end
end
