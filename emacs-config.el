
(setq user-full-name "Mikael Poul Johannesson"
      user-mail-address "mikajoh@gmail.com"
      calendar-latitude 60.39
      calendar-longitude 5.33
      calendar-location-name "Bergen")

(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
