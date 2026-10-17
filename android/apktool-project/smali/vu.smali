.class public final Lvu;
.super Lcb1;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lf90;


# instance fields
.field public n:Lfz0;

.field public o:I

.field public synthetic p:Ljava/lang/Object;

.field public final synthetic q:Lfz0;

.field public final synthetic r:Lwu;

.field public final synthetic s:Ljava/lang/Object;

.field public final synthetic t:Z


# direct methods
.method public constructor <init>(Lfz0;Lwu;Ljava/lang/Object;ZLiq;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lvu;->q:Lfz0;

    .line 2
    .line 3
    iput-object p2, p0, Lvu;->r:Lwu;

    .line 4
    .line 5
    iput-object p3, p0, Lvu;->s:Ljava/lang/Object;

    .line 6
    .line 7
    iput-boolean p4, p0, Lvu;->t:Z

    .line 8
    .line 9
    const/4 p1, 0x2

    .line 10
    invoke-direct {p0, p1, p5}, Lcb1;-><init>(ILiq;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public final f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lo30;

    .line 2
    .line 3
    check-cast p2, Liq;

    .line 4
    .line 5
    invoke-virtual {p0, p2, p1}, Lvu;->j(Liq;Ljava/lang/Object;)Liq;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lvu;

    .line 10
    .line 11
    sget-object p1, Lwe1;->a:Lwe1;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lvu;->m(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public final j(Liq;Ljava/lang/Object;)Liq;
    .locals 6

    .line 1
    new-instance v0, Lvu;

    .line 2
    .line 3
    iget-object v3, p0, Lvu;->s:Ljava/lang/Object;

    .line 4
    .line 5
    iget-boolean v4, p0, Lvu;->t:Z

    .line 6
    .line 7
    iget-object v1, p0, Lvu;->q:Lfz0;

    .line 8
    .line 9
    iget-object v2, p0, Lvu;->r:Lwu;

    .line 10
    .line 11
    move-object v5, p1

    .line 12
    invoke-direct/range {v0 .. v5}, Lvu;-><init>(Lfz0;Lwu;Ljava/lang/Object;ZLiq;)V

    .line 13
    .line 14
    .line 15
    iput-object p2, v0, Lvu;->p:Ljava/lang/Object;

    .line 16
    .line 17
    return-object v0
.end method

.method public final m(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 8

    .line 1
    iget v0, p0, Lvu;->o:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    iget-object v2, p0, Lvu;->s:Ljava/lang/Object;

    .line 5
    .line 6
    iget-object v3, p0, Lvu;->r:Lwu;

    .line 7
    .line 8
    iget-object v4, p0, Lvu;->q:Lfz0;

    .line 9
    .line 10
    const/4 v5, 0x2

    .line 11
    const/4 v6, 0x1

    .line 12
    sget-object v7, Lar;->j:Lar;

    .line 13
    .line 14
    if-eqz v0, :cond_2

    .line 15
    .line 16
    if-eq v0, v6, :cond_1

    .line 17
    .line 18
    if-ne v0, v5, :cond_0

    .line 19
    .line 20
    invoke-static {p1}, Lk42;->n(Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    goto :goto_2

    .line 24
    :cond_0
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 25
    .line 26
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    return-object v1

    .line 30
    :cond_1
    iget-object v0, p0, Lvu;->n:Lfz0;

    .line 31
    .line 32
    iget-object v6, p0, Lvu;->p:Ljava/lang/Object;

    .line 33
    .line 34
    check-cast v6, Lo30;

    .line 35
    .line 36
    invoke-static {p1}, Lk42;->n(Ljava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_2
    invoke-static {p1}, Lk42;->n(Ljava/lang/Object;)V

    .line 41
    .line 42
    .line 43
    iget-object p1, p0, Lvu;->p:Ljava/lang/Object;

    .line 44
    .line 45
    check-cast p1, Lo30;

    .line 46
    .line 47
    invoke-virtual {v3}, Lwu;->c()Lef0;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    iput-object p1, p0, Lvu;->p:Ljava/lang/Object;

    .line 52
    .line 53
    iput-object v4, p0, Lvu;->n:Lfz0;

    .line 54
    .line 55
    iput v6, p0, Lvu;->o:I

    .line 56
    .line 57
    invoke-interface {v0, p0}, Lef0;->c(Lvu;)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    if-ne v0, v7, :cond_3

    .line 62
    .line 63
    goto :goto_1

    .line 64
    :cond_3
    move-object v6, p1

    .line 65
    move-object p1, v0

    .line 66
    move-object v0, v4

    .line 67
    :goto_0
    check-cast p1, Ljava/lang/Number;

    .line 68
    .line 69
    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    iput p1, v0, Lfz0;->j:I

    .line 74
    .line 75
    iput-object v1, p0, Lvu;->p:Ljava/lang/Object;

    .line 76
    .line 77
    iput-object v1, p0, Lvu;->n:Lfz0;

    .line 78
    .line 79
    iput v5, p0, Lvu;->o:I

    .line 80
    .line 81
    invoke-virtual {v6, v2, p0}, Lo30;->b(Ljava/lang/Object;Lkq;)Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    if-ne p1, v7, :cond_4

    .line 86
    .line 87
    :goto_1
    return-object v7

    .line 88
    :cond_4
    :goto_2
    iget-boolean p0, p0, Lvu;->t:Z

    .line 89
    .line 90
    if-eqz p0, :cond_6

    .line 91
    .line 92
    iget-object p0, v3, Lwu;->h:Lbv1;

    .line 93
    .line 94
    new-instance p1, Lpt;

    .line 95
    .line 96
    if-eqz v2, :cond_5

    .line 97
    .line 98
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    goto :goto_3

    .line 103
    :cond_5
    const/4 v0, 0x0

    .line 104
    :goto_3
    iget v1, v4, Lfz0;->j:I

    .line 105
    .line 106
    invoke-direct {p1, v0, v2, v1}, Lpt;-><init>(ILjava/lang/Object;I)V

    .line 107
    .line 108
    .line 109
    invoke-virtual {p0, p1}, Lbv1;->r(Lr91;)V

    .line 110
    .line 111
    .line 112
    :cond_6
    sget-object p0, Lwe1;->a:Lwe1;

    .line 113
    .line 114
    return-object p0
.end method
