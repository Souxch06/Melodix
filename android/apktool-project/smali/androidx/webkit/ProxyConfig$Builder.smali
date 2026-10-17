.class public final Landroidx/webkit/ProxyConfig$Builder;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/webkit/ProxyConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private final mBypassRules:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final mProxyRules:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lmw0;",
            ">;"
        }
    .end annotation
.end field

.field private mReverseBypass:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 27
    iput-boolean v0, p0, Landroidx/webkit/ProxyConfig$Builder;->mReverseBypass:Z

    .line 28
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/webkit/ProxyConfig$Builder;->mProxyRules:Ljava/util/List;

    .line 29
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/webkit/ProxyConfig$Builder;->mBypassRules:Ljava/util/List;

    return-void
.end method

.method public constructor <init>(Landroidx/webkit/ProxyConfig;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Landroidx/webkit/ProxyConfig$Builder;->mReverseBypass:Z

    .line 6
    .line 7
    invoke-virtual {p1}, Landroidx/webkit/ProxyConfig;->getProxyRules()Ljava/util/List;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Landroidx/webkit/ProxyConfig$Builder;->mProxyRules:Ljava/util/List;

    .line 12
    .line 13
    invoke-virtual {p1}, Landroidx/webkit/ProxyConfig;->getBypassRules()Ljava/util/List;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Landroidx/webkit/ProxyConfig$Builder;->mBypassRules:Ljava/util/List;

    .line 18
    .line 19
    invoke-virtual {p1}, Landroidx/webkit/ProxyConfig;->isReverseBypassEnabled()Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    iput-boolean p1, p0, Landroidx/webkit/ProxyConfig$Builder;->mReverseBypass:Z

    .line 24
    .line 25
    return-void
.end method

.method private bypassRules()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Landroidx/webkit/ProxyConfig$Builder;->mBypassRules:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method private proxyRules()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lmw0;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Landroidx/webkit/ProxyConfig$Builder;->mProxyRules:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method private reverseBypass()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Landroidx/webkit/ProxyConfig$Builder;->mReverseBypass:Z

    .line 2
    .line 3
    return p0
.end method


# virtual methods
.method public addBypassRule(Ljava/lang/String;)Landroidx/webkit/ProxyConfig$Builder;
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/webkit/ProxyConfig$Builder;->mBypassRules:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public addDirect()Landroidx/webkit/ProxyConfig$Builder;
    .locals 1

    .line 14
    const-string v0, "*"

    invoke-virtual {p0, v0}, Landroidx/webkit/ProxyConfig$Builder;->addDirect(Ljava/lang/String;)Landroidx/webkit/ProxyConfig$Builder;

    move-result-object p0

    return-object p0
.end method

.method public addDirect(Ljava/lang/String;)Landroidx/webkit/ProxyConfig$Builder;
    .locals 3

    .line 1
    iget-object v0, p0, Landroidx/webkit/ProxyConfig$Builder;->mProxyRules:Ljava/util/List;

    .line 2
    .line 3
    new-instance v1, Lmw0;

    .line 4
    .line 5
    const-string v2, "direct://"

    .line 6
    .line 7
    invoke-direct {v1, p1, v2}, Lmw0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    return-object p0
.end method

.method public addProxyRule(Ljava/lang/String;)Landroidx/webkit/ProxyConfig$Builder;
    .locals 3

    .line 1
    iget-object v0, p0, Landroidx/webkit/ProxyConfig$Builder;->mProxyRules:Ljava/util/List;

    .line 2
    .line 3
    new-instance v1, Lmw0;

    .line 4
    .line 5
    const-string v2, "*"

    .line 6
    .line 7
    invoke-direct {v1, v2, p1}, Lmw0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    return-object p0
.end method

.method public addProxyRule(Ljava/lang/String;Ljava/lang/String;)Landroidx/webkit/ProxyConfig$Builder;
    .locals 2

    .line 14
    iget-object v0, p0, Landroidx/webkit/ProxyConfig$Builder;->mProxyRules:Ljava/util/List;

    new-instance v1, Lmw0;

    invoke-direct {v1, p2, p1}, Lmw0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public build()Landroidx/webkit/ProxyConfig;
    .locals 3

    .line 1
    new-instance v0, Landroidx/webkit/ProxyConfig;

    .line 2
    .line 3
    invoke-direct {p0}, Landroidx/webkit/ProxyConfig$Builder;->proxyRules()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {p0}, Landroidx/webkit/ProxyConfig$Builder;->bypassRules()Ljava/util/List;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-direct {p0}, Landroidx/webkit/ProxyConfig$Builder;->reverseBypass()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    invoke-direct {v0, v1, v2, p0}, Landroidx/webkit/ProxyConfig;-><init>(Ljava/util/List;Ljava/util/List;Z)V

    .line 16
    .line 17
    .line 18
    return-object v0
.end method

.method public bypassSimpleHostnames()Landroidx/webkit/ProxyConfig$Builder;
    .locals 1

    .line 1
    const-string v0, "<local>"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroidx/webkit/ProxyConfig$Builder;->addBypassRule(Ljava/lang/String;)Landroidx/webkit/ProxyConfig$Builder;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public removeImplicitRules()Landroidx/webkit/ProxyConfig$Builder;
    .locals 1

    .line 1
    const-string v0, "<-loopback>"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroidx/webkit/ProxyConfig$Builder;->addBypassRule(Ljava/lang/String;)Landroidx/webkit/ProxyConfig$Builder;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public setReverseBypassEnabled(Z)Landroidx/webkit/ProxyConfig$Builder;
    .locals 0

    .line 1
    iput-boolean p1, p0, Landroidx/webkit/ProxyConfig$Builder;->mReverseBypass:Z

    .line 2
    .line 3
    return-object p0
.end method
