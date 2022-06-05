import { LightningElement, wire } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
//import PokeApp from '@salesforce/resourceUrl/PokeApp';
/** PokemonController.getAllPokes() Apex method */
import searchPokemons from '@salesforce/apex/PokemonController.searchPokemons';
export default class PokemonList extends NavigationMixin(LightningElement) {

	searchTerm = '';
	tipo=null;
	generacion=null;

	@wire(searchPokemons, {searchTerm: '$searchTerm', tipo: '$tipo',generacion: '$generacion'})
	pokemons;

	handleSearchTermChange(event) {
		// Debouncing this method: do not update the reactive property as
		// long as this function is being called within a delay of 300 ms.
		// This is to avoid a very large number of Apex method calls.
		window.clearTimeout(this.delayTimeout);
		const searchTerm = event.target.value;
		// eslint-disable-next-line @lwc/lwc/no-async-operation
		this.delayTimeout = setTimeout(() => {
			this.searchTerm = searchTerm;
		}, 300);
	}
	get hasResults() {
		return (this.pokemons.data.length > 0);
	}
	handleOpenRecordClick() {
		const selectEvent = new CustomEvent('pokeview', {
			detail: this.pokemons.Id
		});
		this.dispatchEvent(selectEvent);
	}
	handlePokeView(event) {
		// Get pokemon record id from pokemonview event
		const pokeId = event.detail;
		// Navigate to pokemon record page
		this[NavigationMixin.Navigate]({
			type: 'standard__recordPage',
			attributes: {
				recordId: pokeId,
				objectApiName: 'Pokemon__c',
				actionName: 'view',
			},
		});
	}
	handlePokeFilter(event){
		this.tipo=event.detail.tipo;
		this.generacion=event.detail.generacion;
	}

}
