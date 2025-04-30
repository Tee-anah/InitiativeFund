;; InitiativeFund: A decentralized platform for community fund allocation
;; Core Data Structures
(define-map backers principal uint)       ;; Tracks users and their backed initiatives
(define-map initiatives uint uint)        ;; Tracks initiatives and their backing counts
(define-data-var initiative-counter uint u0) ;; Keeps count of total registered initiatives

;; Public function to create a new community initiative
(define-public (create-initiative)
  (let ((initiative-id (+ (var-get initiative-counter) u1)))
    (map-set initiatives initiative-id u0)      ;; Initialize backing for the new initiative to 0
    (var-set initiative-counter initiative-id)  ;; Increment initiative-counter
    (ok initiative-id)
  )
)

;; Public function to back an initiative
(define-public (back-initiative (initiative-id uint))
  (let ((contributor tx-sender))
    (if (is-some (map-get? backers contributor))
        (err u1000)  ;; Error: User has already backed an initiative
        (if (is-none (map-get? initiatives initiative-id))
            (err u1001)  ;; Error: Initiative does not exist
            (begin
              ;; Register the user's backing
              (map-set backers contributor initiative-id)
              ;; Increment the initiative's backing count
              (map-set initiatives initiative-id (+ (default-to u0 (map-get? initiatives initiative-id)) u1))
              (ok initiative-id)
            )
        )
    )
  )
)

;; Read-only function to get total backing for an initiative
(define-read-only (get-backing-count (initiative-id uint))
  (default-to u0 (map-get? initiatives initiative-id))
)

;; Read-only function to check if a user has backed any initiative
(define-read-only (has-backed (contributor principal))
  (is-some (map-get? backers contributor))
)

;; Read-only function to get the total number of initiatives
(define-read-only (get-initiative-count)
  (var-get initiative-counter)
)

;; Read-only function to compare two values
(define-read-only (compare-max (a uint) (b uint))
  (if (>= a b)
      a
      b
  )
)