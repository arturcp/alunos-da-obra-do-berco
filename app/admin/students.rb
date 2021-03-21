ActiveAdmin.register Student do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters

  permit_params :name, :description, :email, :phone, :mobile_phone, :address, :gender, :birth_date, :website, :twitter, :instagram, :facebook, :observation, :youtube_video, :status, :avatar

  index do
    id_column
    column :name
    column :email
    column :mobile_phone
    actions
  end

  controller do
    def update
      file = permitted_params[:student][:avatar].tempfile.open.read.force_encoding(Encoding::UTF_8)
      params[:student][:avatar] = Base64.strict_encode64(file)

      @student = Student.find(params[:id])

      if @student.update(permitted_params[:student])
        redirect_to admin_students_path
      else
        render :index
      end
    end

    def create
      file = permitted_params[:student][:avatar].tempfile.open.read.force_encoding(Encoding::UTF_8)
      params[:student][:avatar] = Base64.strict_encode64(file)

      @student = Student.new(permitted_params[:student])

      if @student.save
        redirect_to admin_students_path
      else
        render :index
      end
    end
  end

  form do |f|
    f.semantic_errors
    tabs do
      tab 'Aluno' do
        f.inputs 'Informações Pessoais' do
          f.input :name
          f.input :description
          f.input :birth_date, as: :datepicker
          f.input :email
          f.input :phone
          f.input :mobile_phone
          f.input :address
          f.input :gender, as: :select, collection: [['M', 0], ['F', 1]]
        end
      end

      tab 'Links', html_options: { class: 'specific_css_class' } do
        f.inputs 'Redes, Sites e Documentos' do
          f.input :website
          f.input :twitter
          f.input :instagram
          f.input :facebook
          f.input :observation
          f.input :youtube_video
          f.input :status
          f.input :avatar, as: :file
        end
      end
    end
    f.actions
  end
end
