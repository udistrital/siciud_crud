class NotificationMailer < ApplicationMailer

  def health_check
    mail(to: params["to"],
         cc: params["cc"],
         subject: "Validación funcionamiento servicio de notificaciones SICIUDv2")
  end
end
