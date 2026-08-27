- word-sized integer (w-bit) ($[2^w]$)
- umíme C-like operace: $+,-,*,/,\%$ a bitové $\&,|,\hat{}, \tilde{}, \ll,\gg$ v konstantním čase na w-bitových číslech
- díky bit-shift výpočet mocniny $2$ je v konstantním čase

Operace na $O(w)$-bitových číslech se dají simulovat v konstantním čase.

Důkaz: Máme-li čísla velikosti $c \cdot w$, kde $c\in \mathbb{N}$ konstanta, tak rozdělíme číslo do $c$ $w$-bitových čísel a přidáme jen konstantně mnoho operací navíc pro každou z povolených operací.

- operace $>,<,==$ umí vydat jaké je větší
- paměť je pole indexované w-bit slovem a obsah buňky je w-bitové slovo

Protože $w$-bitové slovo indexuje, tak umíme adresovat maximálně $2^w$ polí tabulky a $n$-velký vstup $\implies$ vždy je nutné $w\geq \log n$.

- **Prostorová složitost** rozdíl mezi nejmenším využitým indexem a nejvyšším.