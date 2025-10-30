defmodule VagasUniversitariasWeb.AuthOverrides do
  use AshAuthentication.Phoenix.Overrides

  override AshAuthentication.Phoenix.Components.Banner do
    set :image_url, "/images/logo.svg"
    set :root_class, "flex justify-center items-center mb-8"
    set :text_class, "text-4xl font-bold text-gray-900"
    set :href_url, "/"
    set :href_class, "hover:opacity-80 transition-opacity"
  end

  override AshAuthentication.Phoenix.SignInLive do
    set :root_class,
        "min-h-screen bg-gradient-to-br from-orange-100 via-pink-100 to-purple-200 flex items-center justify-center p-4 relative overflow-hidden"

    set :sign_in_id, "sign-in-component"
  end

  override AshAuthentication.Phoenix.Components.SignIn do
    set :root_class, "bg-white rounded-3xl shadow-2xl w-full max-w-md p-10 relative z-10"
    set :show_banner, true
    set :strategy_class, "mt-6"

    set :authentication_error_container_class,
        "bg-red-50 border border-red-200 rounded-xl p-4 mb-6"

    set :authentication_error_text_class, "text-sm text-red-600"
    set :strategy_display_order, :forms_first
  end

  override AshAuthentication.Phoenix.Components.Password do
    set :root_class, "w-full"
    set :hide_class, "hidden"
    set :show_first, :sign_in
    set :slot_class, "mt-6"
    set :interstitial_class, "flex items-center my-6"
    set :toggler_class, "text-blue-600 hover:text-blue-700 font-medium transition-colors"
    set :sign_in_toggle_text, "Já tem uma conta? Entre aqui"
    set :register_toggle_text, "Não tem conta? Registre-se"
    set :reset_toggle_text, "Esqueceu sua senha?"
  end

  override AshAuthentication.Phoenix.Components.Password.SignInForm do
    set :root_class, "w-full"
    set :form_class, "space-y-5"
    set :label_class, "text-3xl font-bold text-gray-900 mb-2 text-center"
    set :slot_class, "mt-6"
    set :button_text, "Entrar"
    set :disable_button_text, "Entrando..."
  end

  override AshAuthentication.Phoenix.Components.Password.RegisterForm do
    set :root_class, "w-full"
    set :form_class, "space-y-5"
    set :label_class, "text-3xl font-bold text-gray-900 mb-2 text-center"
    set :slot_class, "mt-6"
    set :button_text, "Criar Conta"
    set :disable_button_text, "Criando conta..."
  end

  override AshAuthentication.Phoenix.Components.Password.ResetForm do
    set :root_class, "w-full"
    set :form_class, "space-y-5"
    set :label_class, "text-3xl font-bold text-gray-900 mb-2 text-center"
    set :slot_class, "mt-6"
    set :button_text, "Enviar Email de Recuperação"
    set :disable_button_text, "Enviando..."
    set :reset_flash_text, "Se o email existir, você receberá um link de recuperação"
  end

  override AshAuthentication.Phoenix.Components.Password.Input do
    set :field_class, "w-full mb-4"
    set :label_class, "block text-sm font-medium text-gray-700 mb-2"

    set :input_class,
        "w-full px-4 py-3 border border-gray-300 rounded-xl focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-all outline-none text-gray-900 placeholder-gray-400"

    set :input_class_with_error,
        "w-full px-4 py-3 border-2 border-red-500 rounded-xl focus:ring-2 focus:ring-red-500 focus:border-transparent transition-all outline-none text-gray-900"

    set :input_debounce, 300

    set :submit_class,
        "w-full bg-gray-900 hover:bg-gray-800 text-white font-semibold py-3 px-6 rounded-xl transition-all duration-200 transform hover:scale-[1.02] active:scale-[0.98] shadow-lg"

    set :error_ul, "mt-2 space-y-1"
    set :error_li, "text-red-600 text-sm"
    set :identity_input_label, "Email"
    set :identity_input_placeholder, "seu@email.com"
    set :password_input_label, "Senha"
    set :password_confirmation_input_label, "Confirmar Senha"
  end

  override AshAuthentication.Phoenix.ResetLive do
    set :root_class,
        "min-h-screen bg-gradient-to-br from-orange-100 via-pink-100 to-purple-200 flex items-center justify-center p-4"

    set :reset_id, "reset-component"
  end

  override AshAuthentication.Phoenix.Components.Reset do
    set :root_class, "bg-white rounded-3xl shadow-2xl w-full max-w-md p-10"
    set :show_banner, true
    set :strategy_class, "mt-6"
  end

  override AshAuthentication.Phoenix.Components.Reset.Form do
    set :root_class, "w-full"
    set :form_class, "space-y-5"
    set :label_class, "text-3xl font-bold text-gray-900 mb-2 text-center"
    set :spacer_class, "mt-5"
    set :disable_button_text, "Redefinindo..."
  end

  override AshAuthentication.Phoenix.ConfirmLive do
    set :root_class,
        "min-h-screen bg-gradient-to-br from-orange-100 via-pink-100 to-purple-200 flex items-center justify-center p-4"

    set :confirm_id, "confirm-component"
  end

  override AshAuthentication.Phoenix.Components.Confirm do
    set :root_class, "bg-white rounded-3xl shadow-2xl w-full max-w-md p-10"
    set :show_banner, true
    set :strategy_class, "mt-6"
  end

  override AshAuthentication.Phoenix.Components.Confirm.Form do
    set :root_class, "w-full"
    set :form_class, "space-y-5"
    set :label_class, "text-3xl font-bold text-gray-900 mb-2 text-center"
    set :disable_button_text, "Confirmando..."
  end

  override AshAuthentication.Phoenix.Components.Confirm.Input do
    set :submit_class,
        "w-full bg-gray-900 hover:bg-gray-800 text-white font-semibold py-3 px-6 rounded-xl transition-all duration-200 transform hover:scale-[1.02] active:scale-[0.98] shadow-lg"

    set :submit_label, "Confirmar Email"
  end

  override AshAuthentication.Phoenix.MagicSignInLive do
    set :root_class,
        "min-h-screen bg-gradient-to-br from-orange-100 via-pink-100 to-purple-200 flex items-center justify-center p-4"

    set :magic_sign_in_id, "magic-sign-in-component"
  end

  override AshAuthentication.Phoenix.Components.MagicLink do
    set :root_class, "w-full"
    set :form_class, "space-y-5"
    set :label_class, "text-3xl font-bold text-gray-900 mb-2 text-center"
    set :disable_button_text, "Enviando..."
    set :request_flash_text, "Enviamos um link mágico para seu email!"
  end

  override AshAuthentication.Phoenix.Components.MagicLink.SignIn do
    set :root_class, "bg-white rounded-3xl shadow-2xl w-full max-w-md p-10"
    set :show_banner, true
    set :strategy_class, "mt-6"
  end

  override AshAuthentication.Phoenix.Components.MagicLink.Form do
    set :root_class, "w-full"
    set :form_class, "space-y-5"
    set :label_class, "text-3xl font-bold text-gray-900 mb-2 text-center"
    set :disable_button_text, "Enviando link..."
  end

  override AshAuthentication.Phoenix.Components.MagicLink.Input do
    set :submit_class,
        "w-full bg-gray-900 hover:bg-gray-800 text-white font-semibold py-3 px-6 rounded-xl transition-all duration-200 transform hover:scale-[1.02] active:scale-[0.98] shadow-lg"

    set :submit_label, "Enviar Link Mágico"
  end

  override AshAuthentication.Phoenix.Components.OAuth2 do
    set :root_class, "w-full mb-3"

    set :link_class,
        "w-full flex items-center justify-center gap-3 bg-white border-2 border-gray-300 hover:border-gray-400 text-gray-900 font-semibold py-3 px-6 rounded-xl transition-all duration-200 transform hover:scale-[1.02] active:scale-[0.98]"

    set :icon_class, "w-5 h-5"
  end

  override AshAuthentication.Phoenix.Components.Apple do
    set :root_class, "w-full mb-3"

    set :link_class,
        "w-full flex items-center justify-center gap-3 bg-black hover:bg-gray-900 text-white font-semibold py-3 px-6 rounded-xl transition-all duration-200 transform hover:scale-[1.02] active:scale-[0.98]"

    set :icon_class, "w-5 h-5"
  end

  override AshAuthentication.Phoenix.Components.HorizontalRule do
    set :root_class, "w-full my-6"
    set :hr_outer_class, "flex items-center"
    set :hr_inner_class, "flex-grow border-t border-gray-300"
    set :text, "ou"
    set :text_outer_class, "px-4"
    set :text_inner_class, "text-sm text-gray-500 font-medium"
  end
end
