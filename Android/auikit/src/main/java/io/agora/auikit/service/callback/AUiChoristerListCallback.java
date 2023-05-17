package io.agora.auikit.service.callback;

import androidx.annotation.Nullable;

import java.util.List;

import io.agora.auikit.model.AUiChoristerModel;

public interface AUiChoristerListCallback {
    void onResult(@Nullable AUiException error, @Nullable List<AUiChoristerModel> songList);
}
