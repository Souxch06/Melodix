.class public final Lj80;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lob0;
.implements Lz21;
.implements Lii1;


# instance fields
.field public final j:Lh70;

.field public final k:Lhi1;

.field public l:Landroidx/lifecycle/a;

.field public m:Lo80;


# direct methods
.method public constructor <init>(Lh70;Lhi1;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lj80;->l:Landroidx/lifecycle/a;

    .line 6
    .line 7
    iput-object v0, p0, Lj80;->m:Lo80;

    .line 8
    .line 9
    iput-object p1, p0, Lj80;->j:Lh70;

    .line 10
    .line 11
    iput-object p2, p0, Lj80;->k:Lhi1;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public final a()Lk6;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lj80;->f()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lj80;->m:Lo80;

    .line 5
    .line 6
    iget-object p0, p0, Lo80;->c:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast p0, Lk6;

    .line 9
    .line 10
    return-object p0
.end method

.method public final b(Lvh0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lj80;->l:Landroidx/lifecycle/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroidx/lifecycle/a;->d(Lvh0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final c()Lwo0;
    .locals 5

    .line 1
    iget-object v0, p0, Lj80;->j:Lh70;

    .line 2
    .line 3
    invoke-virtual {v0}, Lh70;->H()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    :goto_0
    instance-of v2, v1, Landroid/content/ContextWrapper;

    .line 12
    .line 13
    if-eqz v2, :cond_1

    .line 14
    .line 15
    instance-of v2, v1, Landroid/app/Application;

    .line 16
    .line 17
    if-eqz v2, :cond_0

    .line 18
    .line 19
    check-cast v1, Landroid/app/Application;

    .line 20
    .line 21
    goto :goto_1

    .line 22
    :cond_0
    check-cast v1, Landroid/content/ContextWrapper;

    .line 23
    .line 24
    invoke-virtual {v1}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    goto :goto_0

    .line 29
    :cond_1
    const/4 v1, 0x0

    .line 30
    :goto_1
    new-instance v2, Lwo0;

    .line 31
    .line 32
    invoke-direct {v2}, Lwo0;-><init>()V

    .line 33
    .line 34
    .line 35
    iget-object v3, v2, Let;->j:Ljava/lang/Object;

    .line 36
    .line 37
    check-cast v3, Ljava/util/LinkedHashMap;

    .line 38
    .line 39
    if-eqz v1, :cond_2

    .line 40
    .line 41
    sget-object v4, Lok0;->r:Lok0;

    .line 42
    .line 43
    invoke-interface {v3, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    :cond_2
    sget-object v1, Lk42;->m:Lok0;

    .line 47
    .line 48
    invoke-interface {v3, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    sget-object v1, Lk42;->n:Lt11;

    .line 52
    .line 53
    invoke-interface {v3, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    iget-object p0, v0, Lh70;->o:Landroid/os/Bundle;

    .line 57
    .line 58
    if-eqz p0, :cond_3

    .line 59
    .line 60
    sget-object v0, Lk42;->o:Ltb0;

    .line 61
    .line 62
    invoke-interface {v3, v0, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    :cond_3
    return-object v2
.end method

.method public final d()Lhi1;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lj80;->f()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lj80;->k:Lhi1;

    .line 5
    .line 6
    return-object p0
.end method

.method public final e()Landroidx/lifecycle/a;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lj80;->f()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lj80;->l:Landroidx/lifecycle/a;

    .line 5
    .line 6
    return-object p0
.end method

.method public final f()V
    .locals 1

    .line 1
    iget-object v0, p0, Lj80;->l:Landroidx/lifecycle/a;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Landroidx/lifecycle/a;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Landroidx/lifecycle/a;-><init>(Lci0;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lj80;->l:Landroidx/lifecycle/a;

    .line 11
    .line 12
    new-instance v0, Lo80;

    .line 13
    .line 14
    invoke-direct {v0, p0}, Lo80;-><init>(Lz21;)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Lj80;->m:Lo80;

    .line 18
    .line 19
    invoke-virtual {v0}, Lo80;->c()V

    .line 20
    .line 21
    .line 22
    invoke-static {p0}, Lk42;->e(Lz21;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method
