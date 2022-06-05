import { LightningElement } from 'lwc';

export default class PokeFilter extends LightningElement {
    tipo =null;
    generacion=null;
   
    get tipos() {
        return [
            { label: 'Todos', value: null },
            { label: 'Normal', value: 'Normal' },
            { label: 'Luchador', value: 'Fighting' },
            { label: 'Volador', value: 'Flying' },
            { label: 'Veneno', value: 'Poison' },
            { label: 'Tierra', value: 'Ground' },
            { label: 'Piedra', value: 'Rock' },
            { label: 'Insecto', value: 'Bug' },
            { label: 'Fantasma', value: 'Ghost' },
            { label: 'Acero', value: 'Steel' },
            { label: 'Fuego', value: 'Fire' },
            { label: 'Agua', value: 'Water' },
            { label: 'Hierba', value: 'Grass' },
            { label: 'Electrico', value: 'Electric' },
            { label: 'Psiquico', value: 'Psychic' },
            { label: 'Dragon', value: 'Ice' },
            { label: 'Dragon', value: 'Dragon' },
            { label: 'Oscuro', value: 'Dark' },
            { label: 'Hada', value: 'Fairy' },
        ];
    }
    get generaciones() {
      
        return [
            { label: 'Todos', value: null },
            { label: 'Primera', value: '1' },
            { label: 'Segunda', value: '2' },
            { label: 'Tercera', value: '3' },
            { label: 'Cuarta', value: '4' },
            { label: 'Quinta', value: '5' },
            { label: 'Sexta', value: '6' },
            { label: 'Septima', value: '7' },
            { label: 'Octava', value: '8' },
        ];
    }
    handleGeneracionChange(event){
        this.generacion= event.detail.value;
        const selectEvent = new CustomEvent('pokefilter', {
			detail: {tipo:this.tipo,generacion:this.generacion}
		});
		this.dispatchEvent(selectEvent);


    }
    handleTipoChange(event){
        this.tipo= event.detail.value;
        const selectEvent = new CustomEvent('pokefilter', {
			detail: {tipo:this.tipo,generacion:this.generacion}

		});

		this.dispatchEvent(selectEvent);


    }


} 
