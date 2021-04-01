ActiveAdmin.register Student do
  permit_params :name, :description, :email, :phone, :mobile_phone, :address,
    :gender, :birth_date, :website, :twitter, :instagram, :facebook, :observation, :youtube_video, :status, :avatar, :cv

  config.clear_action_items!

  menu label: 'Alunos'

  action_item :add, only: :index do
    link_to "Novo Aluno", new_admin_student_path, method: :get
  end

  index title: 'Alunos' do
    id_column
    column 'Nome', :name
    column 'Email', :email
    column 'Telefone', :phone
    column 'Celular', :mobile_phone
    actions
  end

  filter :name_contains, label: 'Nome'
  filter :email_contains, label: 'Email'
  filter :phone_contains, label: 'Telefone'
  filter :mobile_phone_contains, label: 'Celular'

  controller do
    before_action :encode_avatar, :encode_cv, only: [:update, :create]

    def update
      @student = Student.find(params[:id])

      if @student.update(permitted_params[:student])
        redirect_to admin_students_path
      else
        render :index
      end
    end

    def create
      @student = Student.new(permitted_params[:student])

      if @student.save
        redirect_to admin_students_path
      else
        render :index
      end
    end

    private

    def encode_avatar
      avatar = permitted_params.dig(:student, :avatar)
      return unless avatar

      file = avatar.tempfile.open.read.force_encoding(Encoding::UTF_8)
      params[:student][:avatar] = Base64.strict_encode64(file)
    end

    def encode_cv
      cv = permitted_params.dig(:student, :cv)
      return unless cv

      file = cv.tempfile.open.read.force_encoding(Encoding::UTF_8)
      params[:student][:cv] = Base64.strict_encode64(file)
    end
  end

  form title: 'Novo Aluno' do |f|
    f.semantic_errors
    tabs do
      tab 'Aluno' do
        f.inputs 'Informações Pessoais' do
          f.input :name, label: 'Nome'
          f.input :description, label: 'Descrição'
          f.input :birth_date, as: :datepicker, label: 'Data de Nascimento'
          f.input :email
          f.input :phone, label: 'Telefone'
          f.input :mobile_phone, label: 'Celular'
          f.input :address, label: 'Endereço'
          f.input :gender, as: :select, collection: [['M', 0], ['F', 1]], label: 'Gênero'
        end
      end

      tab 'Links' do
        f.inputs 'Redes, Sites e Documentos' do
          f.input :cv, as: :file, hint: ("<embed src=#{f.object.cv_src}>".html_safe if f.object.cv), label: 'Currículo'
          f.input :website
          f.input :twitter
          f.input :instagram
          f.input :facebook
          f.input :observation, label: 'Observação'
          f.input :youtube_video, label: 'Vídeo no YouTube'
          f.input :status
          f.input :avatar, as: :file, hint: ("<img src=#{f.object.avatar_src} width=\"150\"/>".html_safe if f.object.avatar), label: 'Foto de Perfil'
        end
      end
    end
    f.actions do
      f.action :submit, as: :button, label: 'Cadastrar Aluno'
    end
  end
end
