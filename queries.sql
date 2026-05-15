1.Le Rapport Lisible

SELECT
    v.id_vente AS id_vente,
    p.nom_produit AS produit,
    vi.nom_ville AS ville_magasin,
    v.date_vente AS date_vente,
    v.quantite_vendue AS quantite_vendue
FROM ventes AS v
INNER JOIN produits AS p
    ON v.id_produit = p.id_produit
INNER JOIN magasins AS m
    ON v.id_magasin = m.id_magasin
INNER JOIN villes AS vi
    ON m.id_ville = vi.id_ville
ORDER BY v.date_vente;

2.Focus Grand Kivu


SELECT
    p.nom_produit AS produit,
    p.prix AS prix_unitaire,
    v.quantite_vendue AS quantite_vendue,
    vi.nom_ville AS ville_magasin
FROM ventes AS v
INNER JOIN produits AS p
    ON v.id_produit = p.id_produit
INNER JOIN magasins AS m
    ON v.id_magasin = m.id_magasin
INNER JOIN villes AS vi
    ON m.id_ville = vi.id_ville
WHERE vi.nom_ville IN ('Goma', 'Bukavu')
ORDER BY vi.nom_ville, p.nom_produit;

3.Top Katanga 

SELECT
    p.nom_produit AS produit,
    SUM(v.quantite_vendue) AS total_quantite_vendue
FROM ventes AS v
INNER JOIN produits AS p
    ON v.id_produit = p.id_produit
INNER JOIN categories AS c
    ON p.id_categorie = c.id_categorie
INNER JOIN magasins AS m
    ON v.id_magasin = m.id_magasin
INNER JOIN villes AS vi
    ON m.id_ville = vi.id_ville
WHERE vi.nom_ville = 'Lubumbashi'
  AND c.nom_categorie = 'Running'
GROUP BY p.nom_produit
ORDER BY total_quantite_vendue DESC;

4.Rentabilité par Magasin

SELECT
    m.nom_magasin AS magasin,
    vi.nom_ville AS ville,
    SUM(v.quantite_vendue * p.prix) AS chiffre_affaires_total
FROM ventes AS v
INNER JOIN produits AS p
    ON v.id_produit = p.id_produit
INNER JOIN magasins AS m
    ON v.id_magasin = m.id_magasin
INNER JOIN villes AS vi
    ON m.id_ville = vi.id_ville
GROUP BY m.nom_magasin, vi.nom_ville
ORDER BY chiffre_affaires_total DESC;

5.Inventaire des catégories par Ville

SELECT DISTINCT
    vi.nom_ville AS ville,
    c.nom_categorie AS categorie
FROM ventes AS v
INNER JOIN produits AS p
    ON v.id_produit = p.id_produit
INNER JOIN categories AS c
    ON p.id_categorie = c.id_categorie
INNER JOIN magasins AS m
    ON v.id_magasin = m.id_magasin
INNER JOIN villes AS vi
    ON m.id_ville = vi.id_ville
ORDER BY vi.nom_ville, c.nom_categorie;