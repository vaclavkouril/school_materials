We consider standard Turing machine with 3 tapes
- Read-only input of size $n$
- Write-only output
- Read-write work tape accessed sequentially (not RAM)

All tape heads, state of machine are on worktape, since they are constant and logarithmic size of pointers, we can append them to the worktape.
We consider them all auto-updated with each step.

Initially the work tape is all $0$.

## Configuration Graphs
We have a configuration of worktape $u\in \{ 0,1 \}^S$ and we can move along read bits.

We can draw a graph of configurations by having all possible words (configurations) assigned to a vertex and edges between them by transitions that are based on the read bit.
- $\forall v\in V: \deg_{out}(v)=2$
- $\forall v \in V: \deg_{in}(v)=O(1)$, because there are only limited parts of the configuration word changeable between one bit read
- graphs of size $2^S \iff SPACE(s)$

We denote $G_{M,x}$ the configuration graph of $M$ with fixed $x$ input, we claim that it doesn't have any cycles, it holds since we have only $\deg_{in} =1$ and we need to reach accept/reject.
# Time vs Space
1. $TIME(T) \subseteq SPACE(t+O(\log t))$
2. $SPACE(s) \subseteq TIME(2^s)$

One time step $\to$ one bit of memory

Space $s$ computation $\to$ path in configuration graph, so we get length of computation $\leq|G_{M,x}|\leq |G_{M}| \leq 2^s$.

# Reversibility
$SPACE(s)\subseteq revSPACE(s+O(1))$

$\forall M\in SPACE(s): \exists M_{\to},M_{\leftarrow}\in SPACE(s+O(1))$ s.t. 
1. $M(x)=acc \iff M_{\to}(x)=acc$
2. $\forall v\in G_{M_{\to},x}, M_{\to},M_{\leftarrow}:M_{\to}(M_{\leftarrow}(v)) = M_{\leftarrow}(M_{\to}(v))=v$

For example we get paths
- $M_{\to}(x)=(0^s, u,u_{2},\dots,u_{m},acc)$
- $M_{\leftarrow}(x)=(acc,u_{m},\dots,u_{2},u,0^s)$

Proof: Eulerian tour on $G_{M,x}$, we forget the directions on edges.

We claim $\forall v$ has only $O(1)$ adjacent edges and we number them (lexicografical).

In every step $v,i$ ($i$ is the edge number we came from) take the $i+1$ transition (even if this means backwards in $M(x)$)

Reverse machine just chooses the $i-1$ instead of $i+1$. 

Claim: no loops in $G_{M,x}$ reachable from $0^S$
