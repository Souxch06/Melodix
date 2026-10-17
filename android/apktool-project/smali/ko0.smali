.class public final Lko0;
.super Lih0;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lp80;


# instance fields
.field public final synthetic k:I

.field public final synthetic l:Lno0;


# direct methods
.method public synthetic constructor <init>(Lno0;I)V
    .locals 0

    .line 1
    iput p2, p0, Lko0;->k:I

    .line 2
    .line 3
    iput-object p1, p0, Lko0;->l:Lno0;

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    invoke-direct {p0, p1}, Lih0;-><init>(I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final a()Ljava/lang/Object;
    .locals 4

    .line 1
    iget v0, p0, Lko0;->k:I

    .line 2
    .line 3
    iget-object p0, p0, Lko0;->l:Lno0;

    .line 4
    .line 5
    packed-switch v0, :pswitch_data_0

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lno0;->d:Ljava/lang/String;

    .line 9
    .line 10
    new-instance v1, Ljava/io/File;

    .line 11
    .line 12
    new-instance v2, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lno0;->b:Ljava/io/File;

    .line 18
    .line 19
    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    invoke-static {v1}, Lno0;->f(Ljava/io/File;)V

    .line 37
    .line 38
    .line 39
    return-object v1

    .line 40
    :pswitch_0
    const-string v0, "datastore_shared_counter"

    .line 41
    .line 42
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Lno0;->e:Ljava/lang/String;

    .line 46
    .line 47
    new-instance v1, Ljava/io/File;

    .line 48
    .line 49
    new-instance v2, Ljava/lang/StringBuilder;

    .line 50
    .line 51
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 52
    .line 53
    .line 54
    iget-object p0, p0, Lno0;->b:Ljava/io/File;

    .line 55
    .line 56
    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    invoke-static {v1}, Lno0;->f(Ljava/io/File;)V

    .line 74
    .line 75
    .line 76
    const/high16 p0, 0x38000000

    .line 77
    .line 78
    :try_start_0
    invoke-static {v1, p0}, Landroid/os/ParcelFileDescriptor;->open(Ljava/io/File;I)Landroid/os/ParcelFileDescriptor;

    .line 79
    .line 80
    .line 81
    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 82
    :try_start_1
    invoke-virtual {p0}, Landroid/os/ParcelFileDescriptor;->getFd()I

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    sget-object v1, Ld71;->b:Landroidx/datastore/core/NativeSharedCounter;

    .line 87
    .line 88
    invoke-virtual {v1, v0}, Landroidx/datastore/core/NativeSharedCounter;->nativeTruncateFile(I)I

    .line 89
    .line 90
    .line 91
    move-result v2

    .line 92
    if-nez v2, :cond_1

    .line 93
    .line 94
    invoke-virtual {v1, v0}, Landroidx/datastore/core/NativeSharedCounter;->nativeCreateSharedCounter(I)J

    .line 95
    .line 96
    .line 97
    move-result-wide v0

    .line 98
    const-wide/16 v2, 0x0

    .line 99
    .line 100
    cmp-long v2, v0, v2

    .line 101
    .line 102
    if-ltz v2, :cond_0

    .line 103
    .line 104
    new-instance v2, Ld71;

    .line 105
    .line 106
    invoke-direct {v2, v0, v1}, Ld71;-><init>(J)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 107
    .line 108
    .line 109
    invoke-virtual {p0}, Landroid/os/ParcelFileDescriptor;->close()V

    .line 110
    .line 111
    .line 112
    return-object v2

    .line 113
    :cond_0
    :try_start_2
    new-instance v0, Ljava/io/IOException;

    .line 114
    .line 115
    const-string v1, "Failed to mmap counter file"

    .line 116
    .line 117
    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 118
    .line 119
    .line 120
    throw v0

    .line 121
    :cond_1
    new-instance v0, Ljava/io/IOException;

    .line 122
    .line 123
    const-string v1, "Failed to truncate counter file"

    .line 124
    .line 125
    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 126
    .line 127
    .line 128
    throw v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 129
    :catchall_0
    move-exception v0

    .line 130
    goto :goto_0

    .line 131
    :catchall_1
    move-exception v0

    .line 132
    const/4 p0, 0x0

    .line 133
    :goto_0
    if-eqz p0, :cond_2

    .line 134
    .line 135
    invoke-virtual {p0}, Landroid/os/ParcelFileDescriptor;->close()V

    .line 136
    .line 137
    .line 138
    :cond_2
    throw v0

    .line 139
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
