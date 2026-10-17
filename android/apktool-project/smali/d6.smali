.class public final Ld6;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lxr0;


# instance fields
.field public final synthetic a:Le6;


# direct methods
.method public constructor <init>(Le6;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ld6;->a:Le6;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 4

    .line 1
    iget-object p0, p0, Ld6;->a:Le6;

    .line 2
    .line 3
    invoke-virtual {p0}, Le6;->k()Lq6;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    move-object v1, v0

    .line 8
    check-cast v1, Lg7;

    .line 9
    .line 10
    iget-object v2, v1, Lg7;->t:Landroid/content/Context;

    .line 11
    .line 12
    invoke-static {v2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    invoke-virtual {v2}, Landroid/view/LayoutInflater;->getFactory()Landroid/view/LayoutInflater$Factory;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    if-nez v3, :cond_0

    .line 21
    .line 22
    invoke-virtual {v2, v1}, Landroid/view/LayoutInflater;->setFactory2(Landroid/view/LayoutInflater$Factory2;)V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    invoke-virtual {v2}, Landroid/view/LayoutInflater;->getFactory2()Landroid/view/LayoutInflater$Factory2;

    .line 27
    .line 28
    .line 29
    :goto_0
    iget-object p0, p0, Landroidx/activity/a;->n:Lo80;

    .line 30
    .line 31
    iget-object p0, p0, Lo80;->c:Ljava/lang/Object;

    .line 32
    .line 33
    check-cast p0, Lk6;

    .line 34
    .line 35
    const-string v1, "androidx:appcompat"

    .line 36
    .line 37
    invoke-virtual {p0, v1}, Lk6;->c(Ljava/lang/String;)Landroid/os/Bundle;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0}, Lq6;->b()V

    .line 41
    .line 42
    .line 43
    return-void
.end method
