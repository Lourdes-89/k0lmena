import { expect } from '@playwright/test';
import { Given, When, Then } from '@cucumber/cucumber';
import { BASEURL } from '../config';
import { pages } from '../hooks/hook';
import { validateFirstLocator } from '../utils/validations';
import path from "path";
import {
  documento,
  nombre,
  apellido,
  sexo,
  fechanacimiento,
  consultar,
  divResult,
  divMensj

} from '../locators/AnsesLocators';


When('el usuario completa el formulario sin apellido:', async function (dataTable) {
  for (const page of pages) {

    const row = dataTable.hashes()[0];
    await page.fill('#NumeroDocumento', row.documento);
    await page.fill('#Nombre', row.nombre);
    await page.fill('#Apellido', row.apellido);
    await page.locator(`label[for="sexo_${row.sexo}"]`).click();
    await page.fill('#FechaNacimiento', row.fechanacimiento);

    await page.locator(consultar).click();


   }
});

Then('muestra mensaje', async () => {
  for (const page of pages) {
    const results = page.locator(divMensj);
  }
});