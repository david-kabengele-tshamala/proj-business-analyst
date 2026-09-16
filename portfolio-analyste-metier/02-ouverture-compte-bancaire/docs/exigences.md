# Exigences

## Exigences métier
- BR-001 : le candidat peut soumettre une demande d'ouverture de compte en ligne.
- BR-002 : les données d'identité obligatoires doivent être validées avant la soumission.
- BR-003 : le filtrage KYC doit produire une décision traçable.
- BR-004 : les exceptions doivent être acheminées vers une file d'examen humain.

## Exigences fonctionnelles
- FR-001 : valider les champs obligatoires.
- FR-002 : téléverser le document d'identité.
- FR-003 : enregistrer le résultat du filtrage KYC.
- FR-004 : acheminer les anomalies vers la conformité.
- FR-005 : notifier le candidat du statut de sa demande.

## Exigences non fonctionnelles
- NFR-001 : les informations sensibles doivent être soumises à un contrôle d'accès.
- NFR-002 : les événements de décision doivent être auditables.
- NFR-003 : le statut de la demande doit être cohérent entre les vues client et opérations.
