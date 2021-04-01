ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation

  menu label: 'Administradores'

  config.clear_action_items!

  action_item :add, only: :index do
    link_to "Novo Admin", new_admin_admin_user_path, method: :get
  end

  index title: 'Administradores' do
    selectable_column
    id_column
    column 'Email', :email
    column 'Data de criação', :created_at
    actions
  end

  filter :email_contains, label: 'Email'

  form title: 'Novo Admin' do |f|
    f.inputs do
      f.input :email
      f.input :password, label: 'Senha'
      f.input :password_confirmation, label: 'Confirmar Senha'
    end
    f.actions do
      f.action :submit, as: :button, label: 'Cadastrar Admin'
    end
  end
end
