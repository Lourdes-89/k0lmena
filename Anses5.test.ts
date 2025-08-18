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

Given("navego en constancia de cuil", async () => {
  for (const page of pages) {
    console.log(`Ejecutando prueba en navegador: ${page.context().browser()?.browserType().name()}`);
    await page.goto(BASEURL);
  }
});

When('el usuario completa el formulario sin apellido:', async function (dataTable) {
  for (const page of pages) {

    const row = dataTable.hashes()[0];
    await page.fill('#edit-nro-doc', row.documento);
    await page.fill('#edit-name', row.nombre);
    await page.fill('#edit-lastname', row.apellido);
    await page.locator(`label[for="edit-sexo-${row.sexo}"]`).click();
    await page.fill('#edit-date', row.fechanacimiento);

    await page.locator(consultar).click();


   }
});

Then('muestra mensaje', async () => {
  for (const page of pages) {
    const results = page.locator(divMensj);
  }
});