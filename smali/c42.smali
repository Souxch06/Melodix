.class public final Lc42;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Lnu1;

.field public final synthetic k:Lc52;


# direct methods
.method public constructor <init>(Lc52;Lnu1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Lc42;->j:Lnu1;

    .line 5
    .line 6
    iput-object p1, p0, Lc42;->k:Lc52;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 6

    .line 1
    iget-object v0, p0, Lc42;->k:Lc52;

    .line 2
    .line 3
    iget-object v0, v0, Let;->j:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast v0, Ly02;

    .line 6
    .line 7
    iget-object v1, v0, Ly02;->n:Lvz1;

    .line 8
    .line 9
    iget-object v2, v0, Ly02;->o:Lzy1;

    .line 10
    .line 11
    invoke-static {v1}, Ly02;->j(Let;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v1}, Let;->l()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v1}, Let;->l()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v1}, Lvz1;->p()Landroid/content/SharedPreferences;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    const/4 v4, 0x0

    .line 25
    const-string v5, "dma_consent_settings"

    .line 26
    .line 27
    invoke-interface {v3, v5, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    invoke-static {v3}, Lnu1;->b(Ljava/lang/String;)Lnu1;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    iget-object p0, p0, Lc42;->j:Lnu1;

    .line 36
    .line 37
    iget v4, p0, Lnu1;->a:I

    .line 38
    .line 39
    iget v3, v3, Lnu1;->a:I

    .line 40
    .line 41
    invoke-static {v4, v3}, Lu22;->l(II)Z

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    if-eqz v3, :cond_2

    .line 46
    .line 47
    invoke-virtual {v1}, Lvz1;->p()Landroid/content/SharedPreferences;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    iget-object v3, p0, Lnu1;->b:Ljava/lang/String;

    .line 56
    .line 57
    invoke-interface {v1, v5, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 58
    .line 59
    .line 60
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 61
    .line 62
    .line 63
    invoke-static {v2}, Ly02;->l(Lm22;)V

    .line 64
    .line 65
    .line 66
    iget-object v1, v2, Lzy1;->w:Lso;

    .line 67
    .line 68
    const-string v2, "Setting DMA consent(FE)"

    .line 69
    .line 70
    invoke-virtual {v1, p0, v2}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {v0}, Ly02;->n()Li82;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-virtual {p0}, Li82;->v()Z

    .line 78
    .line 79
    .line 80
    move-result p0

    .line 81
    if-eqz p0, :cond_0

    .line 82
    .line 83
    invoke-virtual {v0}, Ly02;->n()Li82;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    invoke-virtual {p0}, Lgx1;->l()V

    .line 88
    .line 89
    .line 90
    invoke-virtual {p0}, Lay1;->m()V

    .line 91
    .line 92
    .line 93
    new-instance v0, La82;

    .line 94
    .line 95
    invoke-direct {v0, p0}, La82;-><init>(Li82;)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {p0, v0}, Li82;->z(Ljava/lang/Runnable;)V

    .line 99
    .line 100
    .line 101
    return-void

    .line 102
    :cond_0
    invoke-virtual {v0}, Ly02;->n()Li82;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    invoke-virtual {p0}, Lgx1;->l()V

    .line 107
    .line 108
    .line 109
    invoke-virtual {p0}, Lay1;->m()V

    .line 110
    .line 111
    .line 112
    invoke-virtual {p0}, Li82;->u()Z

    .line 113
    .line 114
    .line 115
    move-result v0

    .line 116
    if-eqz v0, :cond_1

    .line 117
    .line 118
    const/4 v0, 0x0

    .line 119
    invoke-virtual {p0, v0}, Li82;->B(Z)Lbc2;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    new-instance v1, Lb72;

    .line 124
    .line 125
    invoke-direct {v1, p0, v0}, Lb72;-><init>(Li82;Lbc2;)V

    .line 126
    .line 127
    .line 128
    invoke-virtual {p0, v1}, Li82;->z(Ljava/lang/Runnable;)V

    .line 129
    .line 130
    .line 131
    :cond_1
    return-void

    .line 132
    :cond_2
    invoke-static {v2}, Ly02;->l(Lm22;)V

    .line 133
    .line 134
    .line 135
    iget-object p0, v2, Lzy1;->u:Lso;

    .line 136
    .line 137
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    const-string v1, "Lower precedence consent source ignored, proposed source"

    .line 142
    .line 143
    invoke-virtual {p0, v0, v1}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 144
    .line 145
    .line 146
    return-void
.end method
