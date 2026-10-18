.class public final Lt6;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lup;
.implements Lhn0;


# instance fields
.field public final synthetic j:Lg7;


# direct methods
.method public synthetic constructor <init>(Lg7;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lt6;->j:Lg7;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public b(Lrm0;Z)V
    .locals 8

    .line 1
    invoke-virtual {p1}, Lrm0;->k()Lrm0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    const/4 v2, 0x1

    .line 7
    if-eq v0, p1, :cond_0

    .line 8
    .line 9
    move v3, v2

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    move v3, v1

    .line 12
    :goto_0
    if-eqz v3, :cond_1

    .line 13
    .line 14
    move-object p1, v0

    .line 15
    :cond_1
    iget-object p0, p0, Lt6;->j:Lg7;

    .line 16
    .line 17
    iget-object v4, p0, Lg7;->U:[Lf7;

    .line 18
    .line 19
    if-eqz v4, :cond_2

    .line 20
    .line 21
    array-length v5, v4

    .line 22
    goto :goto_1

    .line 23
    :cond_2
    move v5, v1

    .line 24
    :goto_1
    if-ge v1, v5, :cond_4

    .line 25
    .line 26
    aget-object v6, v4, v1

    .line 27
    .line 28
    if-eqz v6, :cond_3

    .line 29
    .line 30
    iget-object v7, v6, Lf7;->h:Lrm0;

    .line 31
    .line 32
    if-ne v7, p1, :cond_3

    .line 33
    .line 34
    goto :goto_2

    .line 35
    :cond_3
    add-int/lit8 v1, v1, 0x1

    .line 36
    .line 37
    goto :goto_1

    .line 38
    :cond_4
    const/4 v6, 0x0

    .line 39
    :goto_2
    if-eqz v6, :cond_6

    .line 40
    .line 41
    if-eqz v3, :cond_5

    .line 42
    .line 43
    iget p1, v6, Lf7;->a:I

    .line 44
    .line 45
    invoke-virtual {p0, p1, v6, v0}, Lg7;->o(ILf7;Lrm0;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0, v6, v2}, Lg7;->q(Lf7;Z)V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_5
    invoke-virtual {p0, v6, p2}, Lg7;->q(Lf7;Z)V

    .line 53
    .line 54
    .line 55
    :cond_6
    return-void
.end method

.method public l(Lrm0;)Z
    .locals 1

    .line 1
    invoke-virtual {p1}, Lrm0;->k()Lrm0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-ne p1, v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lt6;->j:Lg7;

    .line 8
    .line 9
    iget-boolean v0, p0, Lg7;->O:Z

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lg7;->u:Landroid/view/Window;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/view/Window;->getCallback()Landroid/view/Window$Callback;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-boolean p0, p0, Lg7;->Z:Z

    .line 22
    .line 23
    if-nez p0, :cond_0

    .line 24
    .line 25
    const/16 p0, 0x6c

    .line 26
    .line 27
    invoke-interface {v0, p0, p1}, Landroid/view/Window$Callback;->onMenuOpened(ILandroid/view/Menu;)Z

    .line 28
    .line 29
    .line 30
    :cond_0
    const/4 p0, 0x1

    .line 31
    return p0
.end method
