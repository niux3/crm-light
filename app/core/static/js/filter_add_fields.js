(()=>{
    let groups = document.querySelectorAll('.group'),
        fieldset = document.querySelector('.addFields'),
        tplButton = `<div class="cell medium-3 flex-container align-bottom"> <button type="button" class="add button primary" style="width:100%">ajouter<button> </div>`,
        addNewFields = ()=>{
            fieldset.insertAdjacentHTML("beforeend", groups[groups.length - 1].outerHTML)
        },
        changeName = ()=>{
            fieldset.querySelectorAll('.group').forEach((g, i)=>{
                let names = ["data", "compare", "value"],
                    inputs = names.map(n => g.querySelector(`*[name$="${n}"]`))
                inputs.forEach(input => { 
                    let motif = `_${i}_`
                    if(input.name[0] === '_'){
                        input.name = `${motif}${input.name.substring(motif.length)}`
                        input.id = `${motif}${input.id.substring(motif.length)}`
                    }else{
                        input.name = `${motif}${input.name}`
                        input.id = `${motif}${input.id}`
                    }
                })
            })
            
        }

    groups[groups.length - 1].insertAdjacentHTML('beforeend', tplButton)
    fieldset.addEventListener('pointerdown', e =>{
        if(e.target.classList.contains('add') && e.target.nodeName.toLowerCase() === 'button'){
            addNewFields()
            changeName()
        }
    })

})()
