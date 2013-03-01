(defvar pa-folder (expand-file-name "project-archetypes" user-emacs-directory))
(defvar pa-project-folder (expand-file-name "projects" "~"))
(defvar pa-out "*project-archetypes-output*")

(defun create-js-buster-browser ()
  (let* ((name (read-string "Project name: "))
         (desc (read-string "Short description: "))
         (p-id (read-string "Project shortcut: "))
         (folder (expand-file-name name pa-project-folder)))
    (copy-directory (expand-file-name "js-buster-browser" pa-folder)
                    folder)
    (let ((default-directory (concat folder "/")))
      (shell-command "git init" pa-out)
      (magit-ignore-file ".rvmrc" nil t)
      (magit-ignore-file "todo.org" nil t)
      (shell-command "npm link buster" pa-out)
      (shell-command "npm install" pa-out)
      (shell-command "git add -A")
      (shell-command "git ci -m \"Initial commit\""))))

(provide 'project-archetypes)
;;; project-archetypes.el ends here
