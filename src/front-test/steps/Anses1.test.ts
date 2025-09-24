//Ejemplo de Pag Anses

import { expect } from '@playwright/test';
import { Given, When, Then } from '@cucumber/cucumber';
import { BASEURL } from '../config';
import { pages } from '../hooks/hook';
import { validateFirstLocator } from '../utils/validations';
import {
  buttonSearch,
  divResult1

} from '../locators/AnsesLocators';

Given("el usuario navega en la pagina de Anses", async () => {
  for (const page of pages) {
    console.log(`Ejecutando prueba en navegador: ${page.context().browser()?.browserType().name()}`);
    await page.goto("https://www.anses.gob.ar/");
  }
});

When('el usuario busca cuil', async () => {
  for (const page of pages) {

    const searchInput = page.locator('input[placeholder="Buscá en ANSES"]:visible');
    const inputId = await searchInput.getAttribute('id');
    console.log(`Usando input visible con id: ${inputId}`); 

    await searchInput.click();
    await searchInput.fill("cuil");

    await page.locator(buttonSearch).click();

  }
});

Then('muestra todos los resultados según la búsqueda', async () => {
  for (const page of pages) {
    const results = page.locator(divResult1);
    await expect(results).toBeVisible();
  }
});