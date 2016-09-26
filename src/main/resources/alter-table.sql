ALTER TABLE ordens ADD FOREIGN KEY (idClasse) REFERENCES classes (id);

ALTER TABLE animais ADD FOREIGN KEY (idOrdem) REFERENCES ordens (id);

ALTER TABLE animais ADD FOREIGN KEY (idHabitat) REFERENCES habitats (id);