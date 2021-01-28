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






### Dark Theme
* https://material.angular.io/guide/theming
* https://material.io/design/color/the-color-system.html#color-usage-and-palettes
* https://stackblitz.com/edit/angular-prefers-color-scheme-service?file=src%2Fapp%2Fapp.component.ts
* https://medium.com/@svenbudak/how-to-implement-dark-light-mode-in-angular-mateiral-with-prefers-color-scheme-ce3e980e2ea5


