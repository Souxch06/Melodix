.class public final Lwt;
.super Lcb1;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lr80;


# instance fields
.field public final synthetic n:I

.field public o:I

.field public final synthetic p:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Liq;I)V
    .locals 0

    .line 1
    iput p3, p0, Lwt;->n:I

    .line 2
    .line 3
    iput-object p1, p0, Lwt;->p:Ljava/lang/Object;

    .line 4
    .line 5
    const/4 p1, 0x1

    .line 6
    invoke-direct {p0, p1, p2}, Lcb1;-><init>(ILiq;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final g(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    .line 1
    iget v0, p0, Lwt;->n:I

    .line 2
    .line 3
    sget-object v1, Lwe1;->a:Lwe1;

    .line 4
    .line 5
    iget-object p0, p0, Lwt;->p:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p1, Liq;

    .line 8
    .line 9
    packed-switch v0, :pswitch_data_0

    .line 10
    .line 11
    .line 12
    new-instance v0, Lwt;

    .line 13
    .line 14
    check-cast p0, Lsu;

    .line 15
    .line 16
    const/4 v2, 0x1

    .line 17
    invoke-direct {v0, p0, p1, v2}, Lwt;-><init>(Ljava/lang/Object;Liq;I)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, v1}, Lwt;->m(Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0

    .line 25
    :pswitch_0
    new-instance v0, Lwt;

    .line 26
    .line 27
    check-cast p0, Lg71;

    .line 28
    .line 29
    const/4 v2, 0x0

    .line 30
    invoke-direct {v0, p0, p1, v2}, Lwt;-><init>(Ljava/lang/Object;Liq;I)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, v1}, Lwt;->m(Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    return-object p0

    .line 38
    nop

    .line 39
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final m(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 7

    .line 1
    iget v0, p0, Lwt;->n:I

    .line 2
    .line 3
    iget-object v1, p0, Lwt;->p:Ljava/lang/Object;

    .line 4
    .line 5
    const-string v2, "call to \'resume\' before \'invoke\' with coroutine"

    .line 6
    .line 7
    sget-object v3, Lar;->j:Lar;

    .line 8
    .line 9
    const/4 v4, 0x1

    .line 10
    const/4 v5, 0x0

    .line 11
    packed-switch v0, :pswitch_data_0

    .line 12
    .line 13
    .line 14
    iget v0, p0, Lwt;->o:I

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    if-ne v0, v4, :cond_0

    .line 19
    .line 20
    invoke-static {p1}, Lk42;->n(Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    invoke-static {v2}, Lz0;->g(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    move-object p1, v5

    .line 28
    goto :goto_0

    .line 29
    :cond_1
    invoke-static {p1}, Lk42;->n(Ljava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    check-cast v1, Lsu;

    .line 33
    .line 34
    iput v4, p0, Lwt;->o:I

    .line 35
    .line 36
    invoke-virtual {v1, p0}, Lsu;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    if-ne p1, v3, :cond_2

    .line 41
    .line 42
    move-object p1, v3

    .line 43
    :cond_2
    :goto_0
    return-object p1

    .line 44
    :pswitch_0
    iget v0, p0, Lwt;->o:I

    .line 45
    .line 46
    sget-object v6, Lwe1;->a:Lwe1;

    .line 47
    .line 48
    if-eqz v0, :cond_5

    .line 49
    .line 50
    if-ne v0, v4, :cond_4

    .line 51
    .line 52
    invoke-static {p1}, Lk42;->n(Ljava/lang/Object;)V

    .line 53
    .line 54
    .line 55
    :cond_3
    move-object v3, v6

    .line 56
    goto :goto_4

    .line 57
    :cond_4
    invoke-static {v2}, Lz0;->g(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    :goto_1
    move-object v3, v5

    .line 61
    goto :goto_4

    .line 62
    :cond_5
    invoke-static {p1}, Lk42;->n(Ljava/lang/Object;)V

    .line 63
    .line 64
    .line 65
    check-cast v1, Lg71;

    .line 66
    .line 67
    iput v4, p0, Lwt;->o:I

    .line 68
    .line 69
    iget-object p0, v1, Lg71;->e:Lgb1;

    .line 70
    .line 71
    invoke-virtual {p0}, Lgb1;->getValue()Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    check-cast p0, Landroid/content/SharedPreferences;

    .line 76
    .line 77
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    iget-object p1, v1, Lg71;->f:Ljava/util/LinkedHashSet;

    .line 82
    .line 83
    if-nez p1, :cond_6

    .line 84
    .line 85
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    .line 86
    .line 87
    .line 88
    goto :goto_3

    .line 89
    :cond_6
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 94
    .line 95
    .line 96
    move-result v2

    .line 97
    if-eqz v2, :cond_7

    .line 98
    .line 99
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 100
    .line 101
    .line 102
    move-result-object v2

    .line 103
    check-cast v2, Ljava/lang/String;

    .line 104
    .line 105
    invoke-interface {p0, v2}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 106
    .line 107
    .line 108
    goto :goto_2

    .line 109
    :cond_7
    :goto_3
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 110
    .line 111
    .line 112
    move-result p0

    .line 113
    if-eqz p0, :cond_a

    .line 114
    .line 115
    iget-object p0, v1, Lg71;->e:Lgb1;

    .line 116
    .line 117
    invoke-virtual {p0}, Lgb1;->getValue()Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    check-cast p0, Landroid/content/SharedPreferences;

    .line 122
    .line 123
    invoke-interface {p0}, Landroid/content/SharedPreferences;->getAll()Ljava/util/Map;

    .line 124
    .line 125
    .line 126
    move-result-object p0

    .line 127
    invoke-interface {p0}, Ljava/util/Map;->isEmpty()Z

    .line 128
    .line 129
    .line 130
    move-result p0

    .line 131
    if-eqz p0, :cond_8

    .line 132
    .line 133
    iget-object p0, v1, Lg71;->c:Landroid/content/Context;

    .line 134
    .line 135
    iget-object v0, v1, Lg71;->d:Ljava/lang/String;

    .line 136
    .line 137
    invoke-static {p0, v0}, Le71;->a(Landroid/content/Context;Ljava/lang/String;)Z

    .line 138
    .line 139
    .line 140
    :cond_8
    if-eqz p1, :cond_9

    .line 141
    .line 142
    invoke-interface {p1}, Ljava/util/Set;->clear()V

    .line 143
    .line 144
    .line 145
    :cond_9
    if-ne v6, v3, :cond_3

    .line 146
    .line 147
    goto :goto_4

    .line 148
    :cond_a
    const-string p0, "Unable to delete migrated keys from SharedPreferences."

    .line 149
    .line 150
    invoke-static {p0}, Lo40;->k(Ljava/lang/String;)V

    .line 151
    .line 152
    .line 153
    goto :goto_1

    .line 154
    :goto_4
    return-object v3

    .line 155
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
