{% if user.civilities == "Monsieur" %}
    Cher {% if user.polite == "t"%}{{ user.firstname }},{% else %}{{ user.civilities }}{% endif %}
{% else %}
    Chère {% if user.polite == "t"%}{{ user.firstname }},{% else %}{{ user.civilities }}{% endif %}
{% endif %}
{% if user.polite == "t"%}
Je te souhaite une touche :
{% else %}
Je vous souhaite une touche :
{% endif %}
de respect, d'ambition, de créativité,
d'écoute, de défis, de passion
et d'excellence.

" {{ citation.content }} "
{{ citation.author }}

{% if user.extension != "" %}
ps : {{ user.extension }}
{% endif %}

Renaud Bourdeau
Tél : +33 603 617 839
LinkedIn : https://fr.linkedin.com/in/renaud-bourdeau-7639b944
Skype : renaud.bourdeau
GitHub : https://github.com/niux3?tab=repositories
GNU/Linux forever
