.class public interface abstract Lkt1;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# direct methods
.method public static j(Lkt1;Lxt1;Ler0;Ljava/util/ArrayList;)Lst1;
    .locals 2

    .line 1
    iget-object p1, p1, Lxt1;->j:Ljava/lang/String;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Lkt1;->k(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    invoke-interface {p0, p1}, Lkt1;->h(Ljava/lang/String;)Lst1;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    instance-of v0, p0, Lms1;

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    check-cast p0, Lms1;

    .line 18
    .line 19
    invoke-virtual {p0, p2, p3}, Lms1;->a(Ler0;Ljava/util/List;)Lst1;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0

    .line 24
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 25
    .line 26
    new-instance p2, Ljava/lang/StringBuilder;

    .line 27
    .line 28
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    const-string p1, " is not a function"

    .line 35
    .line 36
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    throw p0

    .line 47
    :cond_1
    const-string v0, "hasOwnProperty"

    .line 48
    .line 49
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    if-eqz v1, :cond_3

    .line 54
    .line 55
    const/4 p1, 0x1

    .line 56
    invoke-static {v0, p1, p3}, Lbe2;->K(Ljava/lang/String;ILjava/util/List;)V

    .line 57
    .line 58
    .line 59
    const/4 p1, 0x0

    .line 60
    invoke-virtual {p3, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    check-cast p1, Lst1;

    .line 65
    .line 66
    iget-object p3, p2, Ler0;->l:Ljava/lang/Object;

    .line 67
    .line 68
    check-cast p3, Lxn0;

    .line 69
    .line 70
    invoke-virtual {p3, p2, p1}, Lxn0;->A(Ler0;Lst1;)Lst1;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    invoke-interface {p1}, Lst1;->e()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    invoke-interface {p0, p1}, Lkt1;->k(Ljava/lang/String;)Z

    .line 79
    .line 80
    .line 81
    move-result p0

    .line 82
    if-eqz p0, :cond_2

    .line 83
    .line 84
    sget-object p0, Lst1;->g:Liq1;

    .line 85
    .line 86
    return-object p0

    .line 87
    :cond_2
    sget-object p0, Lst1;->h:Liq1;

    .line 88
    .line 89
    return-object p0

    .line 90
    :cond_3
    const-string p0, "Object has no function "

    .line 91
    .line 92
    invoke-static {p0, p1}, Loq;->h(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    const/4 p0, 0x0

    .line 100
    return-object p0
.end method


# virtual methods
.method public abstract b(Ljava/lang/String;Lst1;)V
.end method

.method public abstract h(Ljava/lang/String;)Lst1;
.end method

.method public abstract k(Ljava/lang/String;)Z
.end method
