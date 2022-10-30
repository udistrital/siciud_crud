class NotificationMailer < ApplicationMailer

  def health_check
    mail(to: params["to"],
         cc: params["cc"],
         subject: "Validación funcionamiento servicio de notificaciones SICIUDv2")
  end

  def custom_notification
    mail(to: params["to"],
         cc: params["cc"],
         subject: params["subject"],
         body: params["body"],
         content_type: "text/html"
    )
  end
end
