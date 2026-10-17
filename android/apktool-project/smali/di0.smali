.class public final Ldi0;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public a:Lwh0;

.field public b:Lzh0;


# virtual methods
.method public final a(Lci0;Lvh0;)V
    .locals 3

    .line 1
    invoke-virtual {p2}, Lvh0;->a()Lwh0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Ldi0;->a:Lwh0;

    .line 6
    .line 7
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    if-gez v2, :cond_0

    .line 15
    .line 16
    move-object v1, v0

    .line 17
    :cond_0
    iput-object v1, p0, Ldi0;->a:Lwh0;

    .line 18
    .line 19
    iget-object v1, p0, Ldi0;->b:Lzh0;

    .line 20
    .line 21
    invoke-interface {v1, p1, p2}, Lzh0;->c(Lci0;Lvh0;)V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Ldi0;->a:Lwh0;

    .line 25
    .line 26
    return-void
.end method
