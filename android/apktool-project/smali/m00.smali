.class public final Lm00;
.super Las;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final j:Ll00;


# direct methods
.method public constructor <init>(Landroid/widget/TextView;)V
    .locals 1

    .line 1
    const/4 v0, 0x7

    .line 2
    invoke-direct {p0, v0}, Las;-><init>(I)V

    .line 3
    .line 4
    .line 5
    new-instance v0, Ll00;

    .line 6
    .line 7
    invoke-direct {v0, p1}, Ll00;-><init>(Landroid/widget/TextView;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lm00;->j:Ll00;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final l([Landroid/text/InputFilter;)[Landroid/text/InputFilter;
    .locals 1

    .line 1
    sget-object v0, Lzz;->k:Lzz;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 v0, 0x0

    .line 8
    :goto_0
    if-nez v0, :cond_1

    .line 9
    .line 10
    return-object p1

    .line 11
    :cond_1
    iget-object p0, p0, Lm00;->j:Ll00;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ll00;->l([Landroid/text/InputFilter;)[Landroid/text/InputFilter;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public final o()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lm00;->j:Ll00;

    .line 2
    .line 3
    iget-boolean p0, p0, Ll00;->l:Z

    .line 4
    .line 5
    return p0
.end method

.method public final u(Z)V
    .locals 1

    .line 1
    sget-object v0, Lzz;->k:Lzz;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 v0, 0x0

    .line 8
    :goto_0
    if-nez v0, :cond_1

    .line 9
    .line 10
    return-void

    .line 11
    :cond_1
    iget-object p0, p0, Lm00;->j:Ll00;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ll00;->u(Z)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final v(Z)V
    .locals 1

    .line 1
    sget-object v0, Lzz;->k:Lzz;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 v0, 0x0

    .line 8
    :goto_0
    iget-object p0, p0, Lm00;->j:Ll00;

    .line 9
    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    iput-boolean p1, p0, Ll00;->l:Z

    .line 13
    .line 14
    return-void

    .line 15
    :cond_1
    invoke-virtual {p0, p1}, Ll00;->v(Z)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final x(Landroid/text/method/TransformationMethod;)Landroid/text/method/TransformationMethod;
    .locals 1

    .line 1
    sget-object v0, Lzz;->k:Lzz;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 v0, 0x0

    .line 8
    :goto_0
    if-nez v0, :cond_1

    .line 9
    .line 10
    return-object p1

    .line 11
    :cond_1
    iget-object p0, p0, Lm00;->j:Ll00;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ll00;->x(Landroid/text/method/TransformationMethod;)Landroid/text/method/TransformationMethod;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method
