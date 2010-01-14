require 'test_helper'

class <%= plural_class_name %>ControllerTest < ActionController::TestCase
  context 'The public' do
    setup do
      @<%= singular_name %> = Factory(:<%= singular_name %>)
    end
    context 'on GET to :index' do
      setup do
        get :index
      end
      should_redirect_to('sign-in page') { sign_in_url }
    end
    
    context 'on GET to :show' do
      context 'with existing <%= singular_name %> ID' do
        setup do
          get :show, :id => @<%= singular_name %>.id
        end
        should_redirect_to('sign-in page') { sign_in_url }
      end
      context 'with non-existent <%= singular_name %> ID' do
        setup do
          get :show, :id => 0
        end
        should_redirect_to('home page') { root_url }
      end
    end
    
    context 'on GET to :new' do
      setup do
        get :new
      end
      should_redirect_to('sign-in page') { sign_in_url }
    end

    context 'on GET to :edit' do
      setup do
        get :edit, :id => @<%= singular_name %>.id
      end
      should_redirect_to('sign-in page') { sign_in_url }
    end

    context 'on POST to :create' do
      setup do
        post :create, :<%= singular_name %> => Factory.attributes_for(:<%= singular_name %>)
      end
      should_redirect_to('sign-in page') { sign_in_url }
    end

    context 'on PUT to :update' do
      setup do
        put :update, :id => @<%= singular_name %>.id, :<%= singular_name %> => Factory.attributes_for(:<%= singular_name %>)
      end
      should_redirect_to('sign-in page') { sign_in_url }
    end

    context 'on DELETE to :destroy' do
      setup do
        delete :destroy, :id => @<%= singular_name %>.id
      end
      should_redirect_to('sign-in page') { sign_in_url }
    end
    
  end
  
  context 'A signed-in user' do
    setup do
      @user = Factory(:email_confirmed_user)
      @controller.current_user = @user
    end
    
    context 'with admin privileges' do
      setup do
        @user.add_role('admin')
        @<%= singular_name %> = Factory(:<%= singular_name %>)
      end

      context 'on GET to :index' do
        setup do
          get :index
        end
        should_respond_with :success
        should_render_template(:index)
        should_assign_to(:<%= singular_name %>s)
      end
      
      context 'on GET to :show' do
        context 'with existing <%= singular_name %> ID' do
          setup do
             get :show, :id => @<%= singular_name %>.id
          end
          should_respond_with :success
          should_render_template(:show)
          should_assign_to(:<%= singular_name %>)
        end
        context 'with non-existant <%= singular_name %> ID' do
          setup do
            get :show, :id => 0
          end
          should_set_the_flash_to "Couldn't find that <%= singular_name %>"
          should_redirect_to('home page') { root_url }
        end
      end
      
      context 'on GET to :new' do
        setup do
          get :new
        end
        should_respond_with(:success)
        should_render_template(:new)
        should_assign_to(:<%= singular_name %>)
      end
      
      context 'on POST to :create' do
        context 'given valid parameters' do
          setup do
            post :create, :<%= singular_name %> => Factory.attributes_for(:<%= singular_name %>)
          end
          should_set_the_flash_to 'Successfully created <%= singular_name %>.'
          should_redirect_to('the <%= singular_name %>') { <%= singular_name %>_url(assigns(:<%= singular_name %>)) }
        end
        context 'given invalid parameters' do
          setup do
            post :create, :<%= singular_name %> => { }
          end
          should_respond_with(:success)
          should_render_template(:new)
        end
      end
      
      context 'on GET to :edit' do
        setup do
          get :edit, :id => @<%= singular_name %>.id
        end
        should_respond_with(:success)
        should_render_template(:edit)
        should_assign_to(:<%= singular_name %>)
      end
      
      context 'on PUT to :update' do
        context 'given valid parameters' do
          setup do
            put :update, :id => @<%= singular_name %>.id, :<%= singular_name %> => Factory.attributes_for(:<%= singular_name %>)
          end
          should_set_the_flash_to 'Successfully updated <%= singular_name %>.'
          should_redirect_to('the <%= singular_name %>') { <%= singular_name %>_url(assigns(:<%= singular_name %>)) }
          should_assign_to(:<%= singular_name %>)
        end
        context 'given invalid parameters' do
          setup do
            put :update, :id => @<%= singular_name %>.id, :<%= singular_name %> => { :name => nil }
          end
          should_respond_with(:success)
          should_render_template(:edit)
          should_assign_to(:<%= singular_name %>)
        end
      end

      context 'on DELETE to :destroy' do
        setup do
          delete :destroy, :id => @<%= singular_name %>.id
        end
        should_set_the_flash_to 'Successfully destroyed <%= singular_name %>.'
        should_redirect_to('the <%= singular_name %> index') { <%= singular_name %>s_url }
      end
    end
    
    context 'with read-only privileges' do
      setup do
        @user.remove_role('admin')
        @user.add_role('executive')
        @<%= singular_name %> = Factory(:<%= singular_name %>)
      end
      
      context 'on GET to :index' do
        setup do
          get :index
        end
        should_respond_with :success
        should_render_template(:index)
        should_assign_to(:<%= singular_name %>s)
      end

      context 'on GET to :show' do
        context 'with existing <%= singular_name %> ID' do
          setup do
             get :show, :id => @<%= singular_name %>.id
          end
          should_respond_with :success
          should_render_template(:show)
          should_assign_to(:<%= singular_name %>)
        end
        context 'with non-existent <%= singular_name %> ID' do
          setup do
            get :show, :id => 0
          end
          should_set_the_flash_to "Couldn't find that <%= singular_name %>"
          should_redirect_to('home page') { root_url }
        end
      end
      
      context 'on GET to :new' do
        setup do
          get :new
        end
        should_redirect_to('home page') { root_url }
      end
      
      context 'on POST to :create' do
        context 'given valid parameters' do
          setup do
            post :create, :<%= singular_name %> => Factory.attributes_for(:<%= singular_name %>)
          end
          should_redirect_to('home page') { root_url }
        end
        context 'given invalid parameters' do
          setup do
            post :create, :<%= singular_name %> => { }
          end
          should_redirect_to('home page') { root_url }
        end
      end
      
      context 'on GET to :edit' do
        setup do
          get :edit, :id => @<%= singular_name %>.id
        end
        should_redirect_to('home page') { root_url }
      end
      
      context 'on PUT to :update' do
        context 'given valid parameters' do
          setup do
            put :update, :id => @<%= singular_name %>.id, :<%= singular_name %> => Factory.attributes_for(:<%= singular_name %>)
          end
          should_redirect_to('home page') { root_url }
        end
        context 'given invalid parameters' do
          setup do
            put :update, :id => @<%= singular_name %>.id, :<%= singular_name %> => { :name => nil }
          end
          should_redirect_to('home page') { root_url }
        end
      end

      context 'on DELETE to :destroy' do
        setup do
          delete :destroy, :id => @<%= singular_name %>.id
        end
        should_redirect_to('home page') { root_url }
      end
    end
  end

end
