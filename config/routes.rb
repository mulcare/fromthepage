Fromthepage::Application.routes.draw do

  root :to => 'static#splash'
  get '/blog' => redirect("https://fromthepage.com/blog/")

  devise_for :users, controllers: { masquerades: "masquerades", registrations: "registrations", omniauth_callbacks: 'users/omniauth_callbacks' }

  devise_scope :user do
    get "users/new_trial" => "registrations#new_trial"
  end

  iiif_for 'riiif/image', at: '/image-service'

  get '/omeka_sites/items' => 'omeka_sites#items'

  resources :omeka_sites
  resources :omeka_items

  resources :notes

  get '/admin' => 'admin#index'
  get '/admin/collection_list', to: 'admin#collection_list', as: 'admin_collection_list'
  get '/admin/work_list', to: 'admin#work_list', as: 'admin_work_list'
  get '/admin/owner_list', to: 'admin#owner_list', as: 'admin_owner_list'
  get '/admin/user_list', to: 'admin#user_list', as: 'admin_user_list'
  get '/admin/flag_list', to: 'admin#flag_list', as: 'admin_flag_list'
  get '/admin/uploads', to: 'admin#uploads', as: 'admin_uploads'
  get '/admin/tail_logfile', to: 'admin#tail_logfile', as: 'admin_tail_logfile'
  get '/admin/settings', to: 'admin#settings', as: 'admin_settings'
  get '/admin/user_visits', to: 'admin#user_visits', as: 'admin_user_visits'
  get '/admin/edit_user', to: 'admin#edit_user', as: 'admin_edit_user'
  get '/admin/autoflag', to: 'admin#autoflag', as: 'admin_autoflag'
  get '/admin/ok_flag', to: 'admin#ok_flag', as: 'admin_ok_flag'
  get '/admin/revert_flag', to: 'admin#revert_flag', as: 'admin_revert_flag'
  get '/admin/delete_user', to: 'admin#delete_user', as: 'admin_delete_user'
  get '/admin/view_processing_log', to: 'admin#view_processing_log', as: 'admin_view_processing_log'
  get '/admin/delete_upload', to: 'admin#delete_upload', as: 'admin_delete_upload'
  post '/admin/update', to: 'admin#update', as: 'admin_update'

  get '/dashboard' => 'dashboard#index'
  get '/dashboard/owner' => 'dashboard#owner'
  get '/dashboard/watchlist' => 'dashboard#watchlist'
  get 'dashboard_role' => 'dashboard#dashboard_role'
  get 'guest_dashboard' => 'dashboard#guest'
  get 'findaproject', to: 'dashboard#landing_page', as: :landing_page
  get 'collections', to: 'dashboard#collections_list', as: :collections_list
  get '/dashboard/startproject', to: 'dashboard#startproject', as: 'dashboard_startproject'
  get '/dashboard/summary', to: 'dashboard#summary', as: 'dashboard_summary'
  post '/dashboard/new_upload', to: 'dashboard#new_upload', as: 'dashboard_new_upload'
  post '/dashbaord/create_work', to: 'dashboard#create_work', as: 'dashboard_create_work'
  get 'display_search', to: 'display#search', as: 'display_search'
  get '/deed/list', to: 'deed#list', as: 'deed_list'
  get 'demo', to: 'demo#index', as: 'demo'
  get '/static/metadata', to: 'static#metadata', as: 'static_metadata'
  get '/page_version/show', to: 'page_version#show', as: 'page_version'
  get '/page_version/list', to: 'page_version#list', as: 'page_version_list'
  get '/article_version/show', to: 'article_version#show', as: 'article_version'
  get '/article_version/list', to: 'article_version#list', as: 'article_version_list'
  get '/display/display_page', to: 'display#display_page', as: 'display_page'
  get '/ia/import_work', to: 'ia#import_work', as: 'ia_import_work'
  get '/ia/ia_book_form', to: 'ia#ia_book_form', as: 'ia_book_form'
  match '/ia/confirm_import', to: 'ia#confirm_import', as: 'ia_confirm_import', via: [:get, :post]
  get '/ia/manage', to: 'ia#manage', as: 'ia_manage'
  get '/ia/mark_beginning', to: 'ia#mark_beginning', as: 'ia_mark_beginning'
  get '/ia/mark_end', to: 'ia#mark_end', as: 'ia_mark_end'
  get '/ia/title_from_ocr_top', to: 'ia#title_from_ocr_top', as: 'ia_title_from_ocr_top'
  get '/ia/title_from_ocr_bottom', to: 'ia#title_from_ocr_bottom', as: 'ia_title_from_ocr_bottom'
  post '/ia/convert', to: 'ia#convert', as: 'ia_convert'

  get '/iiif/:id/manifest', :to => 'iiif#manifest', as: :iiif_manifest
  get '/iiif/:id/layer/:type', :to => 'iiif#layer'
  get '/iiif/collection/:collection_id', :to => 'iiif#collection', as: :iiif_collection
  get '/iiif/:page_id/list/:annotation_type', :to => 'iiif#list'
  get '/iiif/:page_id/notes', :to => 'iiif#notes'
  get '/iiif/:page_id/note/:note_id', :to => 'iiif#note'
  get '/iiif/:work_id/canvas/:page_id', :to => 'iiif#canvas'
  get '/iiif/:work_id/status', :to => 'iiif#manifest_status'
  get '/iiif/:work_id/:page_id/status', :to => 'iiif#canvas_status'
#  {scheme}://{host}/{prefix}/{identifier}/annotation/{name}
  get '/iiif/:page_id/annotation/:annotation_type', :to => 'iiif#annotation'
  get '/iiif/:work_id/sequence/:sequence_name', :to => 'iiif#sequence'
  get '/iiif/for/:id', :to => 'iiif#for', :constraints => { :id => /.*/ } # redirector
  get '/iiif/contributions/:domain/:terminus_a_quo/:terminus_ad_quem', constraints: { domain: /.*/ }, :to => 'iiif#contributions'
  get '/iiif/contributions/:domain/:terminus_a_quo', constraints: { domain: /.*/ },:to => 'iiif#contributions'
  get '/iiif/contributions/:domain', constraints: { domain: /.*/ }, :to => 'iiif#contributions'

  get '/iiif/admin/explore/:at_id', :to => 'sc_collections#explore',:constraints => { :at_id => /.*/ }
  get '/iiif/admin/import_manifest', :to => 'sc_collections#import_manifest'

  get 'ZenasMatthews' => 'collection#show', :collection_id => 7
  get 'JuliaBrumfield' => 'collection#show', :collection_id => 1
  get 'YaquinaLights' => 'collection#show', :collection_id => 58

  patch 'work/update_work', :to => 'work#update_work'
  patch 'transcribe/save_transcription', :to => 'transcribe#save_transcription'
  patch 'transcribe/save_translation', :to => 'transcribe#save_translation'
  put 'article/article_category', :to => 'article#article_category'
  patch 'category/update', :to => 'category#update'
  patch 'user/update', :to => 'user#update'

  patch 'page_block/update', :to => 'page_block#update'
  patch 'admin/update_user', :to => 'admin#update_user'
  get 'admin/expunge_confirmation', :to => 'admin#expunge_confirmation'
  patch 'admin/expunge_user', :to => 'admin#expunge_user'

  get '/rails/mailers' => "rails/mailers#index"
  get '/rails/mailers/*path' => "rails/mailers#preview"

  get '/software', to: 'static#software', as: :about
  get '/faq', to: 'static#faq', as: :faq
  get '/static/faq', to: redirect('/faq', status: 301)
  get '/privacy', to: 'static#privacy', as: :privacy
  get '/static/privacy', to: redirect('/privacy', status: 301)
  post '/contact/send', to: 'contact#send_email', as: 'send_contact_email'
  get '/contact', to: 'contact#form', as: 'contact'

  match '/sc_collections/import', to: 'sc_collections#import', as: 'sc_collections_import', via: [:get, :post]
  post '/sc_collections/import_cdm', to: 'sc_collections#import_cdm', as: 'sc_collections_import_cdm'
  match '/sc_collections/convert_manifest', to: 'sc_collections#convert_manifest', as: 'sc_collections_convert_manifest', via: [:get, :post]
  match '/sc_collections/import_collection', to: 'sc_collections#import_collection', as: 'sc_collections_import_collection', via: [:get, :post]
  get '/sc_collections/explore_manifest', to: 'sc_collections#explore_manifest', as: 'sc_collections_explore_manifest'
  get '/sc_collections/explore_collection', to: 'sc_collections#explore_collection', as: 'sc_collections_explore_collection'

  get '/work/delete', to: 'work#delete', as: 'work_delete'
  post '/work/update', to: 'work#update', as: 'work_update'
  get '/work/update_featured_page', to: 'work#update_featured_page', as: 'work_update_featured_page'
  get '/work/pages_tab', to: 'work#pages_tab', as: 'work_pages_tab'
  get '/work/edit', to: 'work#edit', as: 'work_edit'
  get '/work/revert', to: 'work#revert', as: 'work_revert'
  get '/work/versions', to: 'work#versions', as: 'work_versions'

  get '/page/new', to: 'page#new', as: 'page_new'
  get '/page/delete', to: 'page#delete', as: 'page_delete'
  get '/page/reorder_page', to: 'page#reorder_page', as: 'page_reorder_page'
  post '/page/update', to: 'page#update', as: 'page_update'
  get '/page/edit', to: 'page#edit', as: 'page_edit'
  get '/page/rotate', to: 'page#rotate', as: 'page_rotate'
  post '/page/create', to: 'page#create', as: 'page_create'

  get '/transcribe/mark_page_blank', to: 'transcribe#mark_page_blank', as: 'transcribe_mark_page_blank'
  get '/transcribe/display_page', to: 'transcribe#display_page', as: 'transcribe_display_page'
  get '/transcribe/assign_categories', to: 'transcribe#assign_categories', as: 'transcribe_assign_categories'
  get '/transcribe/guest', to: 'transcribe#guest', as: 'transcribe_guest'

  get '/article/list', to: 'article#list', as: 'article_list'
  get '/article/tooltip', to: 'article#tooltip', as: 'article_tooltip'
  get '/article/delete', to: 'article#delete', as: 'article_delete'
  get '/article/show', to: 'article#show', as: 'article_show'
  get '/article/combine_duplicate', to: 'article#combine_duplicate', as: 'article_combine_duplicate'

  get '/display/read_work', to: 'display#read_work', as: 'display_read_work'
  get '/display/read_all_works', to: 'display#read_all_works', as: 'display_read_all_works'

  get '/collection/delete', to: 'collection#delete', as: 'collection_delete'
  get '/collection/activity_download', to: 'collection#activity_download', as: 'collection_activity_download'
  get '/collection/show', to: 'collection#show', as: 'collection_show'
  get '/collection/toggle_collection_active', to: 'collection#toggle_collection_active', as: 'collection_toggle_collection_active'
  get '/collection/contributors_download', to: 'collection#contributors_download', as: 'collection_contributors_download'
  get '/collection/enable_fields', to: 'collection#enable_fields', as: 'collection_enable_fields'
  get '/collection/enable_document_sets', to: 'collection#enable_document_sets', as: 'collection_enable_document_sets'
  get '/collection/enable_ocr', to: 'collection#enable_ocr', as: 'collection_enable_ocr'
  get '/collection/disable_ocr', to: 'collection#disable_ocr', as: 'collection_disable_ocr'
  get '/collection/blank_collection', to: 'collection#blank_collection', as: 'collection_blank_collection'
  get '/collection/edit', to: 'collection#edit', as: 'collection_edit'
  get '/collection/remove_owner', to: 'collection#remove_owner', as: 'collection_remove_owner'
  get '/collection/disable_document_sets', to: 'collection#disable_document_sets', as: 'collection_disable_document_sets'
  get '/collection/disable_fields', to: 'collection#disable_fields', as: 'collection_disable_fields'
  get '/collection/publish_collection', to: 'collection#publish_collection', as: 'collection_publish_collection'
  post '/collection/add_collaborator', to: 'collection#add_collaborator', as: 'collection_add_collaborator'
  get '/collection/remove_collaborator', to: 'collection#remove_collaborator', as: 'collection_remove_collaborator'
  get '/collection/restrict_collection', to: 'collection#restrict_collection', as: 'collection_restrict_collection'
  post '/collection/add_owner', to: 'collection#add_owner', as: 'collection_add_owner'
  post '/collection/update/:id', to: 'collection#update', as: 'collection_update'

  get '/user/update_profile', to: 'user#update_profile', as: 'user_update_profile'

  get '/export/export_all_works', to: 'export#export_all_works', as: 'export_export_all_works'
  get '/export/show', to: 'export#show', as: 'export_show'
  get '/export/tei', to: 'export#tei', as: 'export_tei'
  get '/export/subject_csv', to: 'export#subject_csv', as: 'export_subject_csv'
  get '/export/table_csv', to: 'export#table_csv', as: 'export_table_csv'
  get '/export/export_all_tables', to: 'export#export_all_tables', as: 'export_export_all_tables'
  get '/export/edit_contentdm_credentials', to: 'export#edit_contentdm_credentials', as: 'export_edit_contentdm_credentials'
  get '/export', to: 'export#index', as: 'export_index'
  get '/export/work_plaintext_verbatim', to: 'export#work_plaintext_verbatim', as: 'export_work_plaintext_verbatim'

  get '/category/edit', to: 'category#edit', as: 'category_edit'
  get '/category/add_new', to: 'category#add_new', as: 'category_add_new'
  get '/category/enable_gis', to: 'category#enable_gis', as: 'category_enable_gis'
  get '/category/disable_gis', to: 'category#disable_gis', as: 'category_disable_gis'
  get '/category/delete', to: 'category#delete', as: 'category_delete'
  post '/category/create', to: 'category#create', as: 'category_create'

  post '/application/guest_transcription', to: 'application#guest_transcription', as: 'application_guest_transcription'

  get '/document_sets/restrict_set', to: 'document_sets#restrict_set', as: 'document_sets_restrict_set'
  get '/document_sets/destroy', to: 'document_sets#destroy', as: 'document_sets_destroy'
  get '/document_sets/publish_set', to: 'document_sets#publish_set', as: 'document_sets_publish_set'
  get '/document_sets/remove_set_collaborator', to: 'document_sets#remove_set_collaborator', as: 'document_sets_remove_set_collaborator'
  post '/document_sets/assign_to_set', to: 'document_sets#assign_to_set', as: 'document_sets_assign_to_set'
  post '/document_sets/add_set_collaborator', to: 'document_sets#add_set_collaborator', as: 'document_sets_add_set_collaborator'

  get '/transcription_field/reorder_field', to: 'transcription_field#reorder_field', as: 'transcription_field_reorder_field'
  get '/transcription_field/delete', to: 'transcription_field#delete', as: 'transcription_field_delete'
  get '/transcription_field/edit_fields', to: 'transcription_field#edit_fields', as: 'transcription_field_edit_fields'

  get '/demo/index', to: 'demo#index', as: 'demo_index'

  get 'document_set/edit/:id', :to => 'document_sets#edit', as: :edit_document_set
  get 'document_set/remove_from_set', to: 'document_sets#remove_from_set', as: :remove_from_set
  post 'document_set/create', :to => 'document_sets#create', as: :create_document_set
  post 'document_set/assign_works', :to => 'document_sets#assign_works'
  #get 'transcription_field/edit_fields', to: 'transcription_field#edit_fields', as: :edit_fields
  post 'transcription_field/add_fields', to: 'transcription_field#add_fields', as: :add_fields
  get 'transcription_field/line_form', to: 'transcription_field#line_form'

  resources :document_sets, except: [:show, :create, :edit]

  get '/collection/new', to: 'collection#new', as: 'collection_new'
  post '/collection/create', to: 'collection#create', as: 'collection_create'

  scope ':user_slug' do
    get 'update_profile', to: 'user#update_profile', as: :update_profile

    resources :collection, path: '', only: [:show] do
      get 'statistics', as: :statistics, to: 'statistics#collection'
      get 'settings', as: :settings, to: 'document_sets#settings'
      get 'subjects', as: :subjects, to: 'article#list'
      get 'export', as: :export, to: 'export#index'
      get 'edit_fields', as: :edit_fields, to: 'transcription_field#edit_fields'

      get 'edit', on: :member
      get 'new_work', on: :member
      get 'collaborators', on: :member, to: 'collection#contributors', as: :contributors
      get 'works_list', as: :works_list, to: 'collection#works_list'
      get 'needs_transcription', as: :needs_transcription, to: 'collection#needs_transcription_pages'
      get 'needs_review', as: :needs_review, to: 'collection#needs_review_pages'
      get 'start_transcribing', as: :start_transcribing, to: 'collection#start_transcribing'

      #work related routes
      #have to use match because it must be both get and post
      match ':work_id', to: 'display#read_work', via: [:get, :post], as: :read_work
      #get 'display/read_all_works', as: :read_all_works, to: 'display#read_all_works'
      resources :work, path: '', param: :work_id, only: [:edit] do
        get 'versions', on: :member
        get 'print', on: :member
        get 'pages', on: :member, as: :pages, to: 'work#pages_tab'
        patch 'update_work', on: :member, as: :update
        post 'add_scribe', on: :member
        get 'remove_scribe', on: :member
      end
      get ':work_id/about', param: :work_id, as: :work_about, to: 'work#show'
      get ':work_id/contents', param: :work_id, as: :work_contents, to: 'display#list_pages'
      get ':work_id/help', param: :work_id, as: :work_help, to: 'static#transcribe_help'
      get ':work_id/export/plaintext/searchable', as: 'work_export_plaintext_searchable', to: 'export#work_plaintext_searchable'
      get ':work_id/export/plaintext/verbatim', as: 'work_export_plaintext_verbatim', to: 'export#work_plaintext_verbatim'
      get ':work_id/export/plaintext/emended', as: 'work_export_plaintext_emended', to: 'export#work_plaintext_emended'
      get ':work_id/export/plaintext/translation/verbatim', as: 'work_export_plaintext_translation_verbatim', to: 'export#work_plaintext_translation_verbatim'
      get ':work_id/export/plaintext/translation/emended', as: 'work_export_plaintext_translation_emended', to: 'export#work_plaintext_translation_emended'

      #page related routes
      get ':work_id/display/:page_id', as: 'display_page', to: 'display#display_page'
      get ':work_id/transcribe/:page_id', as: 'transcribe_page', to: 'transcribe#display_page'
      get ':work_id/guest/:page_id', as: 'guest_page', to: 'transcribe#guest'
      get ':work_id/translate/:page_id', as: 'translate_page', to: 'transcribe#translate'
      get ':work_id/help/:page_id', as: 'help_page', to: 'transcribe#help'
      get ':work_id/still_editing/:page_id', to: 'transcribe#still_editing', as: 'transcribe_still_editing'
      get ':work_id/next_untranscribed_page', as: 'next_untranscribed_page', to: 'transcribe#goto_next_untranscribed_page'

      get ':work_id/edit/:page_id', as: 'edit_page', to: 'page#edit'
      get ':work_id/versions/:page_id', as: 'page_version', to: 'page_version#list'
      get ':work_id/export/:page_id/plaintext/searchable', as: 'page_export_plaintext_searchable', to: 'export#page_plaintext_searchable'
      get ':work_id/export/:page_id/plaintext/verbatim', as: 'page_export_plaintext_verbatim', to: 'export#page_plaintext_verbatim'
      get ':work_id/export/:page_id/plaintext/translation/verbatim', as: 'page_export_plaintext_translation_verbatim', to: 'export#page_plaintext_translation_verbatim'
      get ':work_id/export/:page_id/plaintext/emended', as: 'page_export_plaintext_emended', to: 'export#page_plaintext_emended'
      get ':work_id/export/:page_id/plaintext/translation/emended', as: 'page_export_plaintext_translation_emended', to: 'export#page_plaintext_translation_emended'
      get 'export/version'

      # Page Annotations
      get ':work_id/annotation/:page_id/html/transcription', to: 'annotation#page_transcription_html', as: 'annotation_page_transcription_html'
      get ':work_id/annotation/:page_id/html/translation', to: 'annotation#page_translation_html', as: 'annotation_page_translation_html'

      #article related routes
      match 'article/:article_id', to: 'article#show', via: [:get, :post], as: 'article_show'
      get 'article/:article_id/edit', to: 'article#edit', as: 'article_edit'
      get 'article_version/:article_id', to: 'article_version#list', as: 'article_version'
      patch 'article/update/:article_id', to: 'article#update', as: 'article_update'
    end
  end

  get '/:user_id', to: 'user#profile', as: :user_profile

  get 'collection/update/:id', to: 'collection#update', as: :update_collection
end
