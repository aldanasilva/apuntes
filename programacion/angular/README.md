# Angular

## Components

Components are the main building block for Angular applications. Each component consists of:
* An HTML template that declares what renders on the page
* A Typescript class that defines behavior
* A CSS selector that defines how the component is used in a template
* Optionally, CSS styles applied to the template

### Create a component

generate -> g
component -> c


```console
[username@localhost my-app]$ ng generate component <component-name>
```

By default, this command creates the following:
* A folder named after the component
* A component file, `<component-name>.component.ts`
* A template file, `<component-name>.component.html`
* A CSS file, `<component-name>.component.css`
* A testing specification file, `<component-name>.component.spec.ts`

And register the new component in 

```ts
import { OnChanges } from '@angular/core';

export class CambioComponent implements OnChange {

}
ngOnChanges() {

}
```

## Directives

```ts
import { <asd> } from '@angular/common'
```

Date format

```ts
formatDate(
    value: string | number | Date,
    format: string,
    locale: string,
    timezone?: string): string
```

```ts
DatePipe(locale: string)
```


Suscribirse a cambio de una ruta

```ts
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';

@Component({
    selector: 'app-some',
    templateUrl: './app-some.html'
})
export class SomeComponent {

    constructor(
        private _activatedRoute: ActivatedRoute
    )

    ngOnInit() {
        this._activatedRoute.paramMap.subscribe(
            params => {
                let param = params.get('paramName');
                if (!param) {
                    param = 'some value';
                }
                // Do something...
            }
        )
    }
}
```



padre.component.html
```html
<app-hijo [datoHijo]="datoPadre"></app-hijo>
```

padre.component.ts
```ts
public datoPadre: any;
```

hijo.component.ts
```ts
import { Input, OnChanges } from '@angular/core'
///
export class HijoComponent {
    @Input() datoHijo: any;
    ///
    ngOnChanges() {
        // Se requiere esta parte para manejar cada vez que datoHijo cambie
    }
}
```

#### ngClass
```html
<div [ngClass]="value1 == value2 ? 'class1' : 'class2'"></div>
```

```html
<a [routerLink]="['/some/route', param]">link</a>
```

**Parameters**
| Parameter | Description | Examples |
| --------- | ----------- | -------- |
| `value`   | The date to format. | `'2021-01-31 15:57:14'` |
| `format` | The [date-time components](https://angular.io/api/common/DatePipe#description) to include. | `yyyy-MM-dd HH:mm:ss` |
| `locale` | A locale code for the locale format rules to use. | `en-US`, `es-CO` |
| `timezone` | The time zone. Optional. Default is `undefined` | `s`, `d`, `f` |



```ts
let date = new Date();
let datePipe = new DatePipe('es-CO');
console.log(
    new DatePipe('es-CO')
        .transform(
            new Date(),
            'yyyy-MM-dd HH-mm-ss'));
```


### Validators

* 
* 
* 
* 
* 
* 
* 

```html
<input (change)="doSomething($event)">
<button (click)="doSonethingElse()" [disabled]="!archivo">
<ul *ngIf="condition">
    <li *ngFor="let value of values"></li>
</ul>
<div [ngStyle]="{width: progreso+'%'}"></div>
```



## Angular CLI

### Create __my-app__ app

```console
[username@localhost angular]$ ng new my-app --skip-tests
? Do you want to enforce stricter type checking and stricter bundle budgets in the workspace?
  This setting helps improve maintainability and catch bugs ahead of time.
  For more information, see https://angular.io/strict No
? Would you like to add Angular routing? No
? Which stylesheet format would you like to use? CSS
CREATE ...
✔ Packages installed successfully.
    Successfully initialized git.
[username@localhost angular]$ cd my-app
[username@localhost my-app]$ tree src/app
src/app
├── app.component.css
├── app.component.html
├── app.component.ts
└── app.module.ts
```

`--skip-tests` flag is used to avoid creating `*.test.ts` files

### Create __app-routing-module__

```console
[username@localhost my-app]$ ng generate module app-routing --flat --module=app
CREATE src/app/app-routing.module.ts (196 bytes)
UPDATE src/app/app.module.ts (393 bytes)
[username@localhost my-app]$ tree src/app
src/app
├── app.component.css
├── app.component.html
├── app.component.ts
├── app.module.ts
└── app-routing.module.ts
```

### Create __system__ module with __routing__

```console
[username@localhost my-app]$ ng generate module system --routing
CREATE src/app/system/system-routing.module.ts (249 bytes)
CREATE src/app/system/system.module.ts (280 bytes)
[username@localhost my-app]$ tree src/app
src/app
├── app.component.css
├── app.component.html
├── app.component.ts
├── app.module.ts
├── app-routing.module.ts
└── system
    ├── system.module.ts
    └── system-routing.module.ts
```

### Create __system__ component into __system__ module

```console
[username@localhost my-app]$ ng generate component system/system --flat --skip-tests
CREATE src/app/system/system.component.css (0 bytes)
CREATE src/app/system/system.component.html (21 bytes)
CREATE src/app/system/system.component.ts (275 bytes)
UPDATE src/app/system/system.module.ts (349 bytes)
[username@localhost my-app]$ tree src/app
src/app
├── app.component.css
├── app.component.html
├── app.component.ts
├── app.module.ts
├── app-routing.module.ts
└── system
    ├── system.component.css
    ├── system.component.html
    ├── system.component.ts
    ├── system.module.ts
    └── system-routing.module.ts
```

### A

```console
[username@localhost my-app]$
```

### B

```console
[username@localhost my-app]$
```

### C

```console
[username@localhost my-app]$
```

### D

```console
[username@localhost my-app]$
```

### E

```console
[username@localhost my-app]$
```

### F

```console
[username@localhost my-app]$
```

### G

```console
[username@localhost my-app]$
```

### H

```console
[username@localhost my-app]$
```

### I

```console
[username@localhost my-app]$
```









### Dark Theme
* https://material.angular.io/guide/theming
* https://material.io/design/color/the-color-system.html#color-usage-and-palettes
* https://stackblitz.com/edit/angular-prefers-color-scheme-service?file=src%2Fapp%2Fapp.component.ts
* https://medium.com/@svenbudak/how-to-implement-dark-light-mode-in-angular-mateiral-with-prefers-color-scheme-ce3e980e2ea5





#### Angular Router Tutorial
* https://angular.io/guide/router-tutorial-toh
* https://stackblitz.com/angular/eaalpaxvpnbj
* https://stackblitz.com/angular/kmxkdnbbppn


