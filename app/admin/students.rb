ActiveAdmin.register Student do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment

  filter :gender, as: :check_boxes, collection: [['M', 0], ['F', 1]]

  permit_params :name, :description, :email, :phone, :mobile_phone, :address, :gender, :birth_date, :website, :twitter, :instagram, :facebook, :observation, :youtube_video, :status, :avatar

  controller do
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
          f.input :avatar
        end
      end
    end
    f.actions
  end
end
