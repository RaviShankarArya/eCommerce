module ApplicationHelper

    def create_method(object, name, url)
    object.valid?

    respond_to do |format|
      if object.errors.blank?

        # Saving the doctor object
        object.save

        # Setting the flash message
        message = translate("forms.created_successfully", :item => name)
        store_flash_message(message, :success)
        format.html {
          redirect_to send("#{url}",object), notice: message
        }
        format.json { render json: object, status: :created, location: object }
        format.js {}
      else

        # Setting the flash message
        # message = object.errors.full_messages.to_sentence
        # store_flash_message(message, :alert)

        format.html { }
        format.json { render json: object.errors, status: :unprocessable_entity }
        format.js {}
      end
    end
  end

  def update_method(object, name, url)
    object.valid?

    respond_to do |format|
      if object.errors.blank?

        # Saving the practise object
        object.save

        # Setting the flash message
        message = translate("forms.updated_successfully", :item => name)
        store_flash_message(message, :success)

        format.html {
          redirect_to send("#{url}",object), notice: message
        }
        format.json { head :no_content }
        format.js { }

      else

        # Setting the flash message
        # message = object.errors.full_messages.to_sentence
        # store_flash_message(message, :alert)

        format.html {
          render action: "edit"
        }
        format.json { render json: object.errors, status: :unprocessable_entity }
        format.js {}

      end
    end
  end

  def respond(object)
    respond_to do |format|
      format.html { get_collections and render :index }
      format.json { render json: object }
      format.js {}

    end
  end

end
