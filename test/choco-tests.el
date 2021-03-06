(require 'choco)
(require 'ert)

(defmacro choco--should- (from to)
  `(with-temp-buffer
     (let ()
       (insert ,from)
       ;; (indent-region (point-min) (point-max))
       (should (string= (buffer-substring-no-properties (point-min) (point-max))
                      ,to)))))

(defun choco--run-tests ()
  (interactive)
  (if (featurep 'ert)
      (ert-run-tests-interactively "choco--test")
    (message "cant run without ert.")))

(provide 'choco-tests)
