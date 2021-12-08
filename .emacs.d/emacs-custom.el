(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(compilation-scroll-output 'first-error)
 '(custom-safe-themes
   '("aba75724c5d4d0ec0de949694bce5ce6416c132bb031d4e7ac1c4f2dbdd3d580" "a44bca3ed952cb0fd2d73ff3684bda48304565d3eb9e8b789c6cca5c1d9254d1" "819ab08867ef1adcf10b594c2870c0074caf6a96d0b0d40124b730ff436a7496" default))
 '(default-input-method "latin-prefix")
 '(doom-modeline-buffer-file-name-style 'truncate-upto-project)
 '(doom-modeline-mode t)
 '(haskell-stylish-on-save t)
 '(hl-sexp-background-color "#efebe9")
 '(menu-bar-mode nil)
 '(org-agenda-files '("~/Nextcloud/notes/inbox.org"))
 '(org-capture-templates
   '(("l" "link/toread" entry
      (file+olp org-default-notes-file "Tasks" "Reading List" "Uncategorized")
      "* TODO %:description
:PROPERTIES:
:URL: %:link
:END:" :immediate-finish t)
     ("d" "diary" entry
      (file+olp+datetree org-default-notes-file "Diary")
      "* %U
     %?")
     ("t" "todo" entry
      (file+olp org-default-notes-file "Tasks" "Unfiled")
      "* TODO %?")
     ("f" "ankify" entry
      (file+olp org-default-notes-file "Tasks" "Ankify")
      "* TODO %?")
     ("a" "appointment or scheduled event" entry
      (file+olp+datetree org-default-notes-file "Appointments")
      "* %?
 %T" :time-prompt t)))
 '(org-drill-cram-hours 0)
 '(org-drill-scope
   '("~/Nextcloud/notes/org_drill_el_flashcards_and_spaced_repetition_for_org_mode.org" "~/Nextcloud/notes/inbox.org" "~/Nextcloud/notes/curved_spaces.org" "~/Nextcloud/notes/biggest_explosions_youtube.org" "~/Nextcloud/notes/Writing.org" "~/Nextcloud/notes/WTF_Is_Going_on_.org" "~/Nextcloud/notes/Vegetarianism.org" "~/Nextcloud/notes/Reverse_Engineering.org" "~/Nextcloud/notes/Relief_Effort.org" "~/Nextcloud/notes/Recipes.org" "~/Nextcloud/notes/Reading_list.org" "~/Nextcloud/notes/Rationality.org" "~/Nextcloud/notes/Projects.org" "~/Nextcloud/notes/Politics.org" "~/Nextcloud/notes/Pandemics.org" "~/Nextcloud/notes/Nature_of_the_Universe.org" "~/Nextcloud/notes/Logic.org" "~/Nextcloud/notes/Lisp.org" "~/Nextcloud/notes/Linux.org" "~/Nextcloud/notes/John_Deere.org" "~/Nextcloud/notes/Interesting_Graphics_Projects.org" "~/Nextcloud/notes/Haskell_3d_Grapher.org" "~/Nextcloud/notes/Haskell.org" "~/Nextcloud/notes/Garmin_MTP_Explorations.org" "~/Nextcloud/notes/Games.org" "~/Nextcloud/notes/Gamepad_Typing.org" "~/Nextcloud/notes/GTD_Method.org" "~/Nextcloud/notes/Free_Speech.org" "~/Nextcloud/notes/Fermi_Paradox.org" "~/Nextcloud/notes/Exquisite_Corpse.org" "~/Nextcloud/notes/Existential_Risk.org" "~/Nextcloud/notes/Ethics.org" "~/Nextcloud/notes/Emacs.org" "~/Nextcloud/notes/Effective_Altruism.org" "~/Nextcloud/notes/Colorado8_2020.org" "~/Nextcloud/notes/Climate.org" "~/Nextcloud/notes/Blender.org" "~/Nextcloud/notes/BWCA_May_2020.org" "~/Nextcloud/notes/Artificial_Intelligence.org" "~/Nextcloud/notes/Argumennts.org" "~/Nextcloud/notes/Anki.org" "~/Nextcloud/notes/Anamorphic.org" "~/Nextcloud/notes/20201007110205-linear_algebra_freidberg.org" "~/Nextcloud/notes/20201006130750-covid19.org" "~/Nextcloud/notes/20201006123613-exponential_distribution.org" "~/Nextcloud/notes/20201005111530-linear_operator.org" "~/Nextcloud/notes/20201005111114-change_of_coordinates.org" "~/Nextcloud/notes/20201004215457-hidden_markov_models_for_pos_tagging.org" "~/Nextcloud/notes/20200930231050-t_distribution.org" "~/Nextcloud/notes/20200930222755-confidence_interval_for_a_population_mean.org" "~/Nextcloud/notes/20200930215937-probability_and_statistics_for_computer_science.org" "~/Nextcloud/notes/20200930111301-projection.org" "~/Nextcloud/notes/20200929234642-wildfires.org" "~/Nextcloud/notes/20200929232552-linear_types.org" "~/Nextcloud/notes/20200929165758-mountain_bothies.org" "~/Nextcloud/notes/20200928210441-data_warehouse.org" "~/Nextcloud/notes/20200927182318-ethereum_yellow_paper.org" "~/Nextcloud/notes/20200925211455-personal_cloud.org" "~/Nextcloud/notes/20200924211356-kl_divergence.org" "~/Nextcloud/notes/20200924120848-poisson_distribution.org" "~/Nextcloud/notes/20200924120507-multinomial_distribution.org" "~/Nextcloud/notes/20200924120225-binomial_distribution.org" "~/Nextcloud/notes/20200924115925-geometric_distribution.org" "~/Nextcloud/notes/20200924115634-bernoulli_distribution.org" "~/Nextcloud/notes/20200924104340-chebyeshev_s_inequality.org" "~/Nextcloud/notes/20200924104036-markov_s_inequality.org" "~/Nextcloud/notes/20200924102930-expected_value.org" "~/Nextcloud/notes/20200924101754-random_variables.org" "~/Nextcloud/notes/20200923224317-naive_bayes.org" "~/Nextcloud/notes/20200923211659-data_transformation.org" "~/Nextcloud/notes/20200923205643-data_reduction.org" "~/Nextcloud/notes/20200923205211-data_integration.org" "~/Nextcloud/notes/20200923204428-entity_identification.org" "~/Nextcloud/notes/20200923165327-data_cleaning.org" "~/Nextcloud/notes/20200923162621-data_quality_measures.org" "~/Nextcloud/notes/20200923125153-injective.org" "~/Nextcloud/notes/20200923124154-rank.org" "~/Nextcloud/notes/20200923124106-nullity.org" "~/Nextcloud/notes/20200923112712-range_of_a_function.org" "~/Nextcloud/notes/20200923112537-kernel.org" "~/Nextcloud/notes/20200923111510-linear_transformation.org" "~/Nextcloud/notes/20200923110640-inner_product.org" "~/Nextcloud/notes/20200923110035-orthogonal_matrix.org" "~/Nextcloud/notes/20200923105841-unitary_matrices.org" "~/Nextcloud/notes/20200923105616-adjoint_of_a_matrix.org" "~/Nextcloud/notes/20200923103300-singular_matrix.org" "~/Nextcloud/notes/20200921182401-docker.org" "~/Nextcloud/notes/20200921115027-inverting_matrices.org" "~/Nextcloud/notes/20200917001603-dissimilarity_measures.org" "~/Nextcloud/notes/20200916235943-parallel_coordinates_plot.org" "~/Nextcloud/notes/20200916235850-scatter_plot_matrix.org" "~/Nextcloud/notes/20200916235317-quantile_quantile_plot.org" "~/Nextcloud/notes/20200916235153-quantile_plot.org" "~/Nextcloud/notes/20200916233853-chi_squared_test.org" "~/Nextcloud/notes/20200916233454-covariance.org" "~/Nextcloud/notes/20200916231811-data_attributes.org" "~/Nextcloud/notes/20200916153229-consistent_heuristic.org" "~/Nextcloud/notes/20200914163205-law_of_total_probability.org" "~/Nextcloud/notes/20200914124618-dimension.org" "~/Nextcloud/notes/20200909130430-basis.org" "~/Nextcloud/notes/20200909120228-job_search_2020_2021.org" "~/Nextcloud/notes/20200909112200-disjoint_set_data_structure.org" "~/Nextcloud/notes/20200909112116-data_structures.org" "~/Nextcloud/notes/20200909112045-prims_algorith.org" "~/Nextcloud/notes/20200909112031-kruskals_algorith.org" "~/Nextcloud/notes/20200909112008-minimum_spanning_tree.org" "~/Nextcloud/notes/20200909111908-competitive_programming.org" "~/Nextcloud/notes/20200908230634-elliptic_curves.org" "~/Nextcloud/notes/20200906234024-beam_search.org" "~/Nextcloud/notes/20200906233625-admissible_heuristic.org" "~/Nextcloud/notes/20200906232718-a_star.org" "~/Nextcloud/notes/20200904125221-gauss_jordan_elimination.org" "~/Nextcloud/notes/20200903145033-bayes_theorem.org" "~/Nextcloud/notes/20200902214154-twitter_great_migration.org" "~/Nextcloud/notes/20200902114853-null_space.org" "~/Nextcloud/notes/20200902110119-reduced_row_echelen_form.org" "~/Nextcloud/notes/20200902105701-solving_linear_equations_with_matricies.org" "~/Nextcloud/notes/20200902105115-augmented_matrix.org" "~/Nextcloud/notes/20200902103023-trace.org" "~/Nextcloud/notes/20200901170025-bidirectional_search.org" "~/Nextcloud/notes/20200901165538-depth_first_search.org" "~/Nextcloud/notes/20200901165042-uniform_cost_search.org" "~/Nextcloud/notes/20200901164801-breadth_first_search.org" "~/Nextcloud/notes/20200901164719-search.org" "~/Nextcloud/notes/20200901104637-data_preperation.org" "~/Nextcloud/notes/20200901104551-knowledge_discovery.org" "~/Nextcloud/notes/20200901104532-data_mining.org" "~/Nextcloud/notes/20200831140109-vector_space_sum.org" "~/Nextcloud/notes/20200831124021-linear_dependence.org" "~/Nextcloud/notes/20200831122933-span.org" "~/Nextcloud/notes/20200831122604-linear_combonation.org" "~/Nextcloud/notes/20200830170246-conciousness_and_ethics.org" "~/Nextcloud/notes/20200829161050-correlation_coefficient.org" "~/Nextcloud/notes/20200829155537-plotting_data.org" "~/Nextcloud/notes/20200829135541-4_year_plan.org" "~/Nextcloud/notes/20200828172957-man_pages.org" "~/Nextcloud/notes/20200828093815-subspaces.org" "~/Nextcloud/notes/20200827105348-normal_distribution.org" "~/Nextcloud/notes/20200827104215-variance.org" "~/Nextcloud/notes/20200827101401-standard_deviation.org" "~/Nextcloud/notes/20200827094652-descriptive_statistics.org" "~/Nextcloud/notes/20200827083219-accounting.org" "~/Nextcloud/notes/20200826110432-commutative_ring.org" "~/Nextcloud/notes/20200826110321-integral_domain.org" "~/Nextcloud/notes/20200826110239-field.org" "~/Nextcloud/notes/20200826102324-vectorspaces.org" "~/Nextcloud/notes/20200822221627-math416.org" "~/Nextcloud/notes/20200822221617-cs440.org" "~/Nextcloud/notes/20200822221608-cs412.org" "~/Nextcloud/notes/20200822221559-cs241.org" "~/Nextcloud/notes/20200822221547-cs361.org" "~/Nextcloud/notes/20200822221230-fall2020.org" "~/Nextcloud/notes/20200820223619-ansible.org" "~/Nextcloud/notes/20200820141653-business.org" "~/Nextcloud/notes/20200819231543-collective_action.org" "~/Nextcloud/notes/20200804222745-gradient_stability.org" "~/Nextcloud/notes/20200804172402-tongue_covering.org" "~/Nextcloud/notes/20200804172342-harmonica.org" "~/Nextcloud/notes/20200729220255-iid_assumption.org" "~/Nextcloud/notes/20200729220047-statistical_learning_theory.org" "~/Nextcloud/notes/20200729213234-tanh.org" "~/Nextcloud/notes/20200729212647-sigmoid_function.org" "~/Nextcloud/notes/20200728215634-relu.org" "~/Nextcloud/notes/20200728215551-activation_functions.org" "~/Nextcloud/notes/20200728215237-multilayer_perceptrons.org" "~/Nextcloud/notes/20200728160848-israel_palestine.org" "~/Nextcloud/notes/20200727212553-principle_of_maximum_likelihood.org" "~/Nextcloud/notes/20200727210702-softmax_regression.org" "~/Nextcloud/notes/20200726121223-stm.org" "~/Nextcloud/notes/20200726120943-ghc.org" "~/Nextcloud/notes/20200722200956-food_planning_portal.org" "~/Nextcloud/notes/20200721165921-matrix_calculus.org" "~/Nextcloud/notes/20200720222809-minibatch_stochasitc_gradient_descent.org" "~/Nextcloud/notes/20200720221519-linear_regression.org" "~/Nextcloud/notes/20200720212426-stock_holdings.org" "~/Nextcloud/notes/20200719182135-norm.org" "~/Nextcloud/notes/20200719181713-matrix.org" "~/Nextcloud/notes/20200719180433-tensors.org" "~/Nextcloud/notes/20200719174959-sequence_learning.org" "~/Nextcloud/notes/20200719174918-tagging.org" "~/Nextcloud/notes/20200719174828-classification.org" "~/Nextcloud/notes/20200719174637-supervised_machine_learning.org" "~/Nextcloud/notes/20200719174527-regression.org" "~/Nextcloud/notes/20200719130729-dive_into_deep_learning.org" "~/Nextcloud/notes/20200719123341-theres_no_fire_alarm_for_agi.org" "~/Nextcloud/notes/20200717185521-awodey1.org" "~/Nextcloud/notes/20200716203941-hyperbolic_geometry.org" "~/Nextcloud/notes/deere/Report.org"))
 '(org-format-latex-options
   '(:foreground default :background default :scale 2.25 :html-foreground "Black" :html-background "Transparent" :html-scale 1.0 :matchers
		 ("begin" "$1" "$" "$$" "\\(" "\\[")))
 '(org-modules
   '(ol-bbdb ol-bibtex ol-docview ol-eww ol-gnus org-habit ol-info ol-irc ol-mhe ol-rmail ol-w3m))
 '(org-preview-latex-image-directory "/tmp/ltximg/")
 '(org-tags-exclude-from-inheritance '("refile"))
 '(package-selected-packages
   '(utop company purescript-mode exec-path-from-shell disable-mouse magit rjsx-mode typescript-mode rust-mode anki-editor lsp-ivy lsp-ui lsp-mode org-pomodoro projectile yasnippet pdf-tools markdown-mode ivy-hydra counsel ivy evil org-drill org-roam-protoco org-roam-protocol org-protocol general pyvenv pyenv emacsql-sqlite3 org-roam geiser leuven-theme org-noter flyspell-mode web-mode yaml-mode doom-modeline haskell-mode which-key use-package key-chord evil-leader evil-collection))
 '(purescript-mode-hook '(turn-on-purescript-indent))
 '(safe-local-variable-values
   '((auto-revert-mode . t)
     (org-refile-targets
      (nil :maxlevel . 2))
     (org-refile-targets
      (nil :maxlevel . 3))
     (org-refile-targets
      (:maxlevel . 3))))
 '(type-break-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
