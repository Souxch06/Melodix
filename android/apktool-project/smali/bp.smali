.class public final Lbp;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public a:Ljava/util/HashSet;

.field public final b:Lpp;

.field public final c:I

.field public d:Lbp;

.field public e:I

.field public f:I

.field public g:Ln81;


# direct methods
.method public constructor <init>(Lpp;I)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lbp;->a:Ljava/util/HashSet;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput v0, p0, Lbp;->e:I

    .line 9
    .line 10
    const/4 v0, -0x1

    .line 11
    iput v0, p0, Lbp;->f:I

    .line 12
    .line 13
    iput-object p1, p0, Lbp;->b:Lpp;

    .line 14
    .line 15
    iput p2, p0, Lbp;->c:I

    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public final a(Lbp;II)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Lbp;->e()V

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    iput-object p1, p0, Lbp;->d:Lbp;

    .line 8
    .line 9
    iget-object v0, p1, Lbp;->a:Ljava/util/HashSet;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    new-instance v0, Ljava/util/HashSet;

    .line 14
    .line 15
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object v0, p1, Lbp;->a:Ljava/util/HashSet;

    .line 19
    .line 20
    :cond_1
    iget-object p1, p0, Lbp;->d:Lbp;

    .line 21
    .line 22
    iget-object p1, p1, Lbp;->a:Ljava/util/HashSet;

    .line 23
    .line 24
    invoke-virtual {p1, p0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    if-lez p2, :cond_2

    .line 28
    .line 29
    iput p2, p0, Lbp;->e:I

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_2
    const/4 p1, 0x0

    .line 33
    iput p1, p0, Lbp;->e:I

    .line 34
    .line 35
    :goto_0
    iput p3, p0, Lbp;->f:I

    .line 36
    .line 37
    return-void
.end method

.method public final b()I
    .locals 3

    .line 1
    iget-object v0, p0, Lbp;->b:Lpp;

    .line 2
    .line 3
    iget v0, v0, Lpp;->V:I

    .line 4
    .line 5
    const/16 v1, 0x8

    .line 6
    .line 7
    if-ne v0, v1, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_0
    iget v0, p0, Lbp;->f:I

    .line 12
    .line 13
    const/4 v2, -0x1

    .line 14
    if-le v0, v2, :cond_1

    .line 15
    .line 16
    iget-object v2, p0, Lbp;->d:Lbp;

    .line 17
    .line 18
    if-eqz v2, :cond_1

    .line 19
    .line 20
    iget-object v2, v2, Lbp;->b:Lpp;

    .line 21
    .line 22
    iget v2, v2, Lpp;->V:I

    .line 23
    .line 24
    if-ne v2, v1, :cond_1

    .line 25
    .line 26
    return v0

    .line 27
    :cond_1
    iget p0, p0, Lbp;->e:I

    .line 28
    .line 29
    return p0
.end method

.method public final c()Z
    .locals 3

    .line 1
    iget-object p0, p0, Lbp;->a:Ljava/util/HashSet;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    goto :goto_1

    .line 6
    :cond_0
    invoke-virtual {p0}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    :cond_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_2

    .line 15
    .line 16
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lbp;

    .line 21
    .line 22
    iget-object v1, v0, Lbp;->b:Lpp;

    .line 23
    .line 24
    iget v0, v0, Lbp;->c:I

    .line 25
    .line 26
    invoke-static {v0}, Loq;->t(I)I

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    packed-switch v2, :pswitch_data_0

    .line 31
    .line 32
    .line 33
    new-instance p0, Ljava/lang/AssertionError;

    .line 34
    .line 35
    invoke-static {v0}, Loq;->s(I)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-direct {p0, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    throw p0

    .line 43
    :pswitch_0
    iget-object v0, v1, Lpp;->y:Lbp;

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :pswitch_1
    iget-object v0, v1, Lpp;->x:Lbp;

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :pswitch_2
    iget-object v0, v1, Lpp;->A:Lbp;

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :pswitch_3
    iget-object v0, v1, Lpp;->z:Lbp;

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :pswitch_4
    const/4 v0, 0x0

    .line 56
    :goto_0
    invoke-virtual {v0}, Lbp;->d()Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-eqz v0, :cond_1

    .line 61
    .line 62
    const/4 p0, 0x1

    .line 63
    return p0

    .line 64
    :cond_2
    :goto_1
    const/4 p0, 0x0

    .line 65
    return p0

    .line 66
    nop

    .line 67
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_4
    .end packed-switch
.end method

.method public final d()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lbp;->d:Lbp;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public final e()V
    .locals 1

    .line 1
    iget-object v0, p0, Lbp;->d:Lbp;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, v0, Lbp;->a:Ljava/util/HashSet;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    :cond_0
    const/4 v0, 0x0

    .line 13
    iput-object v0, p0, Lbp;->d:Lbp;

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    iput v0, p0, Lbp;->e:I

    .line 17
    .line 18
    const/4 v0, -0x1

    .line 19
    iput v0, p0, Lbp;->f:I

    .line 20
    .line 21
    return-void
.end method

.method public final f()V
    .locals 2

    .line 1
    iget-object v0, p0, Lbp;->g:Ln81;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ln81;

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    invoke-direct {v0, v1}, Ln81;-><init>(I)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lbp;->g:Ln81;

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-virtual {v0}, Ln81;->c()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lbp;->b:Lpp;

    .line 7
    .line 8
    iget-object v1, v1, Lpp;->W:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ":"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget p0, p0, Lbp;->c:I

    .line 19
    .line 20
    invoke-static {p0}, Loq;->s(I)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0
.end method
