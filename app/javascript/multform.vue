<!-- <template>
     <div>
     <label v-bind:for="params">{{ label }}</label>
     <div v-for="(list, index) in lists">
     <div class="form-group">
     <div class="form-row">
     <div class="col-7">
     <input
     class="form-control"
     required="required"
     multiple="multiple"
     v-bind:type="type"
     v-bind:name="params | item"
     v-bind:id="params"
     v-bind:placeholder="placeholder"
     v-model="list.inputText"
     >
     </div>
     <div class="col">
     <button v-on:click="onDelete(index)"  type="button" class="btn btn-danger">削除</button>
     </div>
     </div>
     </div>
     </div>
     <button type="button" v-on:click="onAdd" class="btn btn-success"> 追加</button>
     </div>
     </template> -->

<template>
    <div>
	<div v-for="(list, index) in lists">
	    <div class="form-group">
		<div class="form-row">
		    <div class="col-5">
			<input
			    class="form-control"
			    required="required"
			    multiple="multiple"
			    type="text"
			    name="product_name[]"
			    id="product_name"
			    placeholder="品物名"
			    v-model="list.product_name"
			>
		    </div>
		    <div class="col-1">
			<input
                            class="form-control"
                            required="required"
                            multiple="multiple"
                            type="number"
			    name="price[]"
			    id="price"
			    praceholder="1"
			    v-model="list.price"
                        >
		    </div>
		    <div class="col-1">			
                        <input
                            class="form-control"
                            required="required"
                            multiple="multiple"
                            type="number"
                            name="quantity[]"
                            id="quantity"
                            praceholder="個数"
			    v-model="list.quantity"
                        >
                    </div>
		    <div class="col-1">
			<button v-on:click="onDelete(index)"  type="button" class="btn btn-danger">削除</button>
		    </div>
		</div>
	    </div>
	</div>
	<button type="button" v-on:click="onAdd" class="btn btn-success"> 追加</button>
    </div>
</template>


<script>
 export default{
     data: function () {
	return {
	    counter: 1,
	    lists: [
		{
		    id: 1,
		    product_name: "",
		    price: "",
		    quantity: "",
		    inputText: ""
		}
	    ],
	}
     },
     methods: {
	 onDelete(index){
	     this.lists.splice(index, 1);
	 },
	 onAdd(){
	     this.counter += 1
	     this.lists.push({
		 id: this.counter
	     });
	 },
     },
     filters: {
	 item: function(val){
	     return String(val) + "[]"
	 }
     },
     props: ['params','label','type', 'placeholder']
 }
</script>
