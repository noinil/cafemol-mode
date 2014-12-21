;;; cafemol-mode.el --- CafeMol major mode

;; Copyright (C) 2014 Kyoto University

;; Author: Cheng Tan
;; Keywords: CafeMol

;;; Commentary:

;;; Code:

(defvar cafemol-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map "\C-j" 'newline-and-indent)
    map)
  "Keymap for `cafemol-mode'.")

(defvar cafemol-mode-syntax-table
  (let ((st (make-syntax-table)))
    (modify-syntax-entry ?* ". 12" st)
    (modify-syntax-entry ?\n ">" st)
    st)
  "Syntax table for `cafemol-mode'.")

;;; ------------------------------
;;  _     _       _     _ _       _     _   _
;; | |__ (_) __ _| |__ | (_) __ _| |__ | |_(_)_ __   __ _
;; | '_ \| |/ _` | '_ \| | |/ _` | '_ \| __| | '_ \ / _` |
;; | | | | | (_| | | | | | | (_| | | | | |_| | | | | (_| |
;; |_| |_|_|\__, |_| |_|_|_|\__, |_| |_|\__|_|_| |_|\__, |
;;          |___/           |___/                   |___/
;; define keywords, types, consts, events, functions
(setq cafemol-keywords
      '("i_run_mode" "i_simulate_type" "i_initial_state" "i_initial_velo" "i_periodic"
        "path_pdb" "path_ini" "path_natinfo" "path_para" "path" "filename"
        "i_seq_read_style" "i_go_native_read_style"
        "SEQRES" "i_flp" "i_use_atom_protein" "i_use_atom_dna" "i_go_atom_dna"
        "i_output_energy_style" "i_coef_from_ninfo" "i_temp_independent"
        "i_aicg" "filename_aicg" "bdemax_mgo" "baemax_mgo" "dihemax_mgo"
        "cenm" "dfcontact_enm" "cutoff_ele" "ionic_strength" "diele_water"
        "i_diele" "i_calc_method" "coef_hp" "k_dih" "k_ang"
        "n_step_sim" "n_tstep" "tstep_size" "n_step_save" "n_step_rst"
        "n_step_neighbor" "tempk" "tempk_ref" "i_rand_type" "n_seed"
        "i_com_zeroing_ini" "i_com_zeroing" "i_no_trans_rot" "ANCH" "ANCH_CENTER_INI"
        "i_implig" "i_redef_para" "i_energy_para" "i_neigh_dist"
        "i_mass" "i_fric" "i_mass_fric" "i_del_int" "i_anchor" "i_rest1d"
        "i_bridge" "i_pulling" "i_fix" "i_in_box" "i_in_cap" "i_modified_muca"
        "i_method" "i_out" "n_out_step" "epsilon" "sd_lambda_init" "sd_rho_accept"
        "sd_rho_reject" "cg_lambda_init" "cg_rho" "cg_wolfe_c1" "cg_wolfe_c2"
        "nsite_implig" "initial_state_implig" "istep_implig" "istep_un_implig"
        "bind_rate_implig" "itype_ene_implig" "gauss_d_implig" "pre_implig"
        "rneighbor_dist" "rlocal_all" "rlocal_unit" "go_all" "go_unit"
        "rndist_all" "rndist_unit" "rmass_all" "rmass_unit" "rmass_mp"
        "fric_all" "fric_unit" "fric_mp" "rest1d" "rest1d_center" "i_lower_bound"
        "BRIDGE" "BRIDGE_CENTER" "BRIDGE_PPR" "PULL_CF" "PULL_MP_CF" "PULL_UNIT_CF"
        "PULL_ALL_CF" "PULL_CV" "PULL_UNRAVEL_CF" "i_force_unit" "FIX_UNIT" "FIX_MP"
        "xbox" "ybox" "zbox" "boxsigma" "rcap" "kcap" "CENTER"
        "tempk_upper" "tempk_lower" "tempk_init" "tempk_last"
        "n_time_change" "n_replica_temp" "n_replica_ion" "n_replica_pull" "n_step_exchange"
        "n_step_save_rep" "n_period_prob" "npar_rep" "i_exchange" "i_opt_temp"
        "n_step_opt_temp" "n_stage_opt_temp" "i_style" "value_lowest" "value_highest"
        "exponent" "em_depth" "em_mid" "em_sigma"))
(setq cafemol-types
      '("filenames" "job_cntl" "unit_and_state" "initial_struct" "initial_velo"
        "native_info_sim1" "sequence" "dssp_file" "energy_function" "aicg"
        "multiple_go" "elastic_network" "electrostatic" "hydrophobic"
        "flexible_local" "md_information" "group" "energy_minimize"
        "implicit_ligand" "bindng_site" "redefine_para" "energy_para"
        "neighbor_dist" "mass_friction" "del_interaction"
        "anchor_para" "rest1d_para" "bridge_para" "pulling_para"
        "fix_para" "in_box" "in_cap" "searching_tf" "annealing" "replica"
        "replica_temp" "replica_ion" "modified_muca" "replica_wind"
        "replica_pull"
        "integer" "real"))
(setq cafemol-constants
      '("L_GO" "L_AICG1" "L_AICG2" "L_AICG2_PLUS" "L_FLP" "L_BOND" "L_ENM" "L_BDNA"
        "L_LIP_BROWN" "L_LIP_NOGU" "L_RIGID_LIG" "L_DTRNA" "L_DNA2" "L_DNA2C"
        "GO" "EXV" "ELE" "DNA" "DNA2" "DNA2C" "LIP_BROWN" "LOP_NOGU" "LIP_SOLV"
        "ENM" "HP" "MORSE" "PAIR_RNA" "ION_HYD" "ION_EXV" "AICG1" "AICG2" "DTRNA"
        "protein" "dna2" "rna" "dna"))
(setq cafemol-events
      '("pdb" "ninfo" "psf" "dcd" "rst" "imp" "value"))
(setq cafemol-functions
      '("NINFO" "OUTPUT" "MULTIGO_SYSTEM" "ENEGAP" "DELTA" "DEL_BA_DIH"
        "CHARGE_TYPE" "CHARGE_DEL" "CHARGE_ADD" "CHARGE_CHANGE" "HPE_ADD"
        "DEL_LGO_ADD_FLP" "FLP_ADD" "FLP_DEL" "GROUP" "IMPLIGSITE"
        "DEL_GO" "REPLICA" "WINDOW"))

;; create the regex string for each class of keywords
(setq cafemol-keywords-regexp (regexp-opt cafemol-keywords 'words))
(setq cafemol-type-regexp (regexp-opt cafemol-types 'words))
(setq cafemol-constant-regexp (regexp-opt cafemol-constants 'words))
(setq cafemol-event-regexp (regexp-opt cafemol-events 'words))
(setq cafemol-functions-regexp (regexp-opt cafemol-functions 'words))
;; clear defined lists
(setq cafemol-keywords nil)
(setq cafemol-types nil)
(setq cafemol-constants nil)
(setq cafemol-events nil)
(setq cafemol-functions nil)
;; font-lock lists
(setq cafemol-font-lock-keywords
      `(
        (,cafemol-keywords-regexp . font-lock-keyword-face)
        (,cafemol-type-regexp . font-lock-type-face)
        (,cafemol-constant-regexp . font-lock-constant-face)
        (,cafemol-event-regexp . font-lock-builtin-face)
        (,cafemol-functions-regexp . font-lock-function-name-face)
        ))

(defun sample-indent-line ()
   "Indent current line of Sample code."
   (interactive)
   (let ((savep (> (current-column) (current-indentation)))
         (indent (condition-case nil (max (sample-calculate-indentation) 0)
                   (error 0))))
     (if savep
         (save-excursion (indent-line-to indent))
       (indent-line-to indent))))

(defun sample-calculate-indentation ()
  "Return the column to which the current line should be indented."
  )

;;; ------------------------------
;;  ____        __ _       _ _   _
;; |  _ \  ___ / _(_)_ __ (_) |_(_) ___  _ __
;; | | | |/ _ \ |_| | '_ \| | __| |/ _ \| '_ \
;; | |_| |  __/  _| | | | | | |_| | (_) | | | |
;; |____/ \___|_| |_|_| |_|_|\__|_|\___/|_| |_|
;;
(define-derived-mode cafemol-mode fundamental-mode "Cafemol"
  "A major mode for editing Cafemol input files."
  :syntax-table cafemol-mode-syntax-table
  (setq-local comment-start "** ")
  ;; (setq-local comment-start-skip "#+\\s-*")
  (setq font-lock-defaults '((cafemol-font-lock-keywords)))
  (setq-local indent-line-function 'cafemol-indent-line)
  ;; trash cleaning
  (setq cafemol-keywords-regexp nil)
  (setq cafemol-types-regexp nil)
  (setq cafemol-constants-regexp nil)
  (setq cafemol-events-regexp nil)
  (setq cafemol-functions-regexp nil)
  )

(provide 'cafemol-mode)
;;; cafemol-mode.el ends here
